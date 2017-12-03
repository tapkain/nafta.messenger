package com.naftamessenger.usecase

import com.naftamessenger.data.database.NaftaMessengerDatabase
import com.naftamessenger.data.preferences.SharedPreferencesManager
import com.naftamessenger.util.transformToken
import com.naftamessenger.web.WebApi
import javax.inject.Inject

/**
 * Created by Bohdan on 03.12.2017
 */
class DownloadAllDataUseCase @Inject constructor(
		private val webApi: WebApi,
		private val sharedPreferencesManager: SharedPreferencesManager,
		private val naftaMessengerDatabase: NaftaMessengerDatabase
) {

	fun downloadChats() {
		val response = webApi.getChats(sharedPreferencesManager.token.transformToken()).execute()

		if (!response.isSuccessful)
			return

		response.body()?.let(naftaMessengerDatabase.chatsDAO()::insertChats)
	}

	fun downloadUsers() {
		val response = webApi.getAllUsers(sharedPreferencesManager.token.transformToken()).execute()

		if (!response.isSuccessful)
			return

		response.body()?.let(naftaMessengerDatabase.usersDAO()::insertUsers)

		val currentResponse = webApi.getCurrent(sharedPreferencesManager.token.transformToken()).execute()

		if (!response.isSuccessful)
			return

		sharedPreferencesManager.currentUserId = currentResponse.body()?.id
	}

	fun clearAllData() {
		naftaMessengerDatabase.chatsDAO().clearChats()
		naftaMessengerDatabase.usersDAO().clearUsers()
	}
}