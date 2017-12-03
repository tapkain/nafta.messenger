package com.naftamessenger.presenter

import com.naftamessenger.usecase.AccountUseCase
import com.naftamessenger.util.isNetworkAvailable
import com.naftamessenger.view.RegisterView
import javax.inject.Inject

/**
 * Created by Bohdan on 27.11.2017
 */
class RegisterPresenter @Inject constructor(private val accountUseCase: AccountUseCase) : Presenter<RegisterView> {

	private lateinit var registerView: RegisterView

	override fun onBind(view: RegisterView) {
		registerView = view

		registerView.run {
			setRegisterAction {
				val email = getEmail()
				val password = getPassword()
				val confirmPassword = getConfirmPassword()
				val name = getName()
				val surname = getSurname()

				if (email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() || name.isEmpty() || surname.isEmpty())
					return@setRegisterAction

				if (password != confirmPassword)
					return@setRegisterAction

				if (!isNetworkAvailable())
					return@setRegisterAction

				val result = accountUseCase.register(email, password, confirmPassword, name, surname).get()

				if (!result)
					return@setRegisterAction

				if (accountUseCase.login(email, password).get())
					view.onLoginSuccess()
			}
		}
	}


	override fun onUnbind() {}
}