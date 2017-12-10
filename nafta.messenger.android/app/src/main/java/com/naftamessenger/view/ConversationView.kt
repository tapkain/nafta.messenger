package com.naftamessenger.view

import com.naftamessenger.data.models.local.Message

/**
 * Created by Bohdan on 03.12.2017
 */
interface ConversationView : View {

	fun setMessages(messages: List<Message>)

	fun setIsMeAction(action: ParametrizedViewAction<String, Boolean>)

	fun setChatName(chatName: String)

	fun getChatId(): Int

	fun setSyncAction(syncAction: ViewAction)

	fun setSendMessageAction(sendMessageAction: ParametrizedViewAction<String, Unit>)
}