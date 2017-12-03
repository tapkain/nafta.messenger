package com.naftamessenger.view

import com.naftamessenger.data.models.local.Message

/**
 * Created by Bohdan on 03.12.2017
 */
interface ConversationView {

	fun setMessages(messages: List<Message>)

	fun setIsMeAction(action: (Int) -> Boolean)
}