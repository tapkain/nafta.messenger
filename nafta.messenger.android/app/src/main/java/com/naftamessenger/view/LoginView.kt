package com.naftamessenger.view

/**
 * Created by Bohdan on 19.11.2017
 */
interface LoginView : View {

	fun setLoginAction(loginAction: ViewAction)

	fun getMail(): String

	fun getPassword(): String

	fun onLoginSuccess()
}