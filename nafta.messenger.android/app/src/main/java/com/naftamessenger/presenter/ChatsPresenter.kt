package com.naftamessenger.presenter

import com.naftamessenger.usecase.ChatsUseCase
import com.naftamessenger.view.ChatsView
import javax.inject.Inject

/**
 * Created by Bohdan on 02.12.2017
 */
class ChatsPresenter @Inject constructor(private val chatsUseCase: ChatsUseCase) : Presenter<ChatsView> {

	private lateinit var chatsView: ChatsView

	override fun onBind(view: ChatsView) {
		chatsView = view
		chatsView.setChats(chatsUseCase.getChats())
	}

	override fun onUnbind() {}
}