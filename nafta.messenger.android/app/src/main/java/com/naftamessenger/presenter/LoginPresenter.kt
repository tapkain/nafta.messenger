package com.naftamessenger.presenter

import com.naftamessenger.usecase.LoginUseCase
import com.naftamessenger.view.LoginView
import javax.inject.Inject

/**
 * Created by Bohdan on 19.11.2017
 */
class LoginPresenter @Inject constructor(private val loginUseCase: LoginUseCase) : Presenter<LoginView> {

	private lateinit var loginView: LoginView

	override fun onBind(view: LoginView) {
		loginView = view
	}

	override fun onUnbind() {}
}