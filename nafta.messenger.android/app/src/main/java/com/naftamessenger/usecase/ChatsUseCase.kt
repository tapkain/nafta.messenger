package com.naftamessenger.usecase

import com.naftamessenger.data.database.NaftaMessengerDatabase
import com.naftamessenger.data.models.local.Chat
import org.jetbrains.anko.doAsyncResult
import javax.inject.Inject

/**
 * Created by Bohdan on 02.12.2017
 */
class ChatsUseCase @Inject constructor(private val database: NaftaMessengerDatabase) {

	fun getChats(): List<Chat> = doAsyncResult { database.chatsDAO().getChats() }.get()
}