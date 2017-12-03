package com.naftamessenger.view

import com.naftamessenger.data.models.local.Chat

/**
 * Created by Bohdan on 30.11.2017
 */
interface ChatsView : View {

	fun setChats(chats: List<Chat>)
}