package com.naftamessenger.presenter

import com.naftamessenger.data.database.NaftaMessengerDatabase
import com.naftamessenger.data.models.dto.MessageModel
import com.naftamessenger.data.models.local.Message
import com.naftamessenger.data.preferences.SharedPreferencesManager
import com.naftamessenger.util.transformToken
import com.naftamessenger.web.WebApi
import org.jetbrains.anko.doAsync
import org.jetbrains.anko.doAsyncResult
import javax.inject.Inject

/**
 * Created by Bohdan on 10.12.2017
 */
class ConversationUseCase @Inject constructor(
		private val database: NaftaMessengerDatabase,
		private val webApi: WebApi,
		private val sharedPreferencesManager: SharedPreferencesManager
) {

	fun getCurrentUserId() = sharedPreferencesManager.currentUserId

	fun getChatName(chatId: Int): String = doAsyncResult { database.chatsDAO().getChats().first { chat -> chat.id == chatId }.name }.get()

	fun getMessages(chatId: Int): List<Message> = doAsyncResult {
		val response = webApi.getMessages(chatId, sharedPreferencesManager.token.transformToken()).execute()

		if (!response.isSuccessful)
			return@doAsyncResult ArrayList<Message>()

		return@doAsyncResult response.body() ?: ArrayList<Message>()
	}.get()

	fun sendMessage(chatId: Int, text: String) = doAsync {
		webApi.sendMessage(chatId, MessageModel(text), sharedPreferencesManager.token.transformToken()).execute()
	}.get()
}