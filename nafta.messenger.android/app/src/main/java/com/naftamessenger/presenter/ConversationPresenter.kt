package com.naftamessenger.presenter

import com.naftamessenger.util.isNetworkAvailable
import com.naftamessenger.view.ConversationView
import javax.inject.Inject

/**
 * Created by Bohdan on 10.12.2017
 */

class ConversationPresenter @Inject constructor(private val conversationUseCase: ConversationUseCase) : Presenter<ConversationView> {

	override fun onBind(view: ConversationView) {
		val chatId: Int = view.getChatId()

		view.setChatName(conversationUseCase.getChatName(chatId))

		if (!isNetworkAvailable())
			return

		view.setMessages(conversationUseCase.getMessages(chatId))

		view.setIsMeAction {
			it == conversationUseCase.getCurrentUserId()
		}

		view.setSyncAction {
			view.setMessages(conversationUseCase.getMessages(chatId))
		}

		view.setSendMessageAction { text -> conversationUseCase.sendMessage(view.getChatId(), text) }
	}

	override fun onUnbind() {}
}