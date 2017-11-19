package com.naftamessenger.presenter

import com.naftamessenger.usecase.MainUseCase
import com.naftamessenger.view.MainView
import javax.inject.Inject

/**
 * Created by bohdan on 10/16/17
 */
class MainPresenter @Inject constructor(private val mainUseCase: MainUseCase) : Presenter<MainView> {

	private lateinit var mainView: MainView

	override fun onBind(view: MainView) {
		mainView = view

		if (!mainUseCase.isLoggedIn())
			mainView.startLogin()
	}

	override fun onUnbind() {

	}

}