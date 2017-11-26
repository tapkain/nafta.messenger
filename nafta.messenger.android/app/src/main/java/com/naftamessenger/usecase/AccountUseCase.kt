package com.naftamessenger.usecase

import com.naftamessenger.data.models.dto.RegistrationModel
import com.naftamessenger.data.models.dto.TokenModel
import com.naftamessenger.data.preferences.SharedPreferencesManager
import com.naftamessenger.web.WebApi
import org.jetbrains.anko.doAsyncResult
import retrofit2.Response
import java.util.concurrent.Future
import javax.inject.Inject

/**
 * Created by Bohdan on 19.11.2017
 */
class AccountUseCase @Inject constructor(private val webApi: WebApi, private val sharedPreferencesManager: SharedPreferencesManager) {

	fun login(email: String, password: String) = doAsyncResult {
		val response: Response<TokenModel> = webApi.login(email = email, password = password).execute()

		if (!response.isSuccessful)
			return@doAsyncResult false

		response.body()?.run {
			sharedPreferencesManager.mail = username
			sharedPreferencesManager.token = accessToken
			sharedPreferencesManager.tokenValidDate = expiresAt?.time ?: 0
		}

		return@doAsyncResult true
	}

	fun register(email: String, password: String, confirmPassword: String, name: String, surname: String): Future<Boolean> = doAsyncResult {
		val registrationModel = RegistrationModel().also {
			it.email = email
			it.password = password
			it.confirmPassword = confirmPassword
			it.name = name
			it.surname = surname
		}

		return@doAsyncResult webApi.register(registrationModel).execute().isSuccessful
	}

	fun logout() {
		sharedPreferencesManager.mail = null
		sharedPreferencesManager.token = null
	}
}