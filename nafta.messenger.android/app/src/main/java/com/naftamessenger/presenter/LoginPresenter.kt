package com.naftamessenger.presenter

import com.naftamessenger.usecase.AccountUseCase
import com.naftamessenger.util.isNetworkAvailable
import com.naftamessenger.view.LoginView
import javax.inject.Inject

/**
 * Created by Bohdan on 19.11.2017
 */
class LoginPresenter @Inject constructor(private val accountUseCase: AccountUseCase) : Presenter<LoginView> {

	private lateinit var loginView: LoginView

	override fun onBind(view: LoginView) {
		loginView = view

		loginView.run {
			setLoginAction {
				val mail = getMail()
				val password = getPassword()

				if (mail.isEmpty() || password.isEmpty())
					return@setLoginAction

				if (isNetworkAvailable() && accountUseCase.login(mail, password).get())
					onLoginSuccess()
			}
		}
	}

	override fun onUnbind() {}
}