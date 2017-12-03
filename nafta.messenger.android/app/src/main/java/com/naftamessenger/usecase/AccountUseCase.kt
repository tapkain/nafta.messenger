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
		val registrationModel = registerModel {
			this.email = email
			this.password = password
			this.confirmPassword = confirmPassword
			this.name = name
			this.surname = surname
		}

		val result = webApi.register(registrationModel).execute()

		return@doAsyncResult result.isSuccessful
	}

	fun logout() {
		sharedPreferencesManager.mail = null
		sharedPreferencesManager.token = null
	}

	fun isLoggedIn(): Boolean = !sharedPreferencesManager.token.isEmpty()

	private fun registerModel(initBlock: RegistrationModel.() -> Unit): RegistrationModel {
		val registrationModel = RegistrationModel()
		registrationModel.initBlock()
		return registrationModel;
	}
}