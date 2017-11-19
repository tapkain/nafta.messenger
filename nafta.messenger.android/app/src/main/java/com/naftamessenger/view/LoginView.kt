package com.naftamessenger.view

/**
 * Created by Bohdan on 19.11.2017
 */
interface LoginView : View {

	fun setLoginAction(loginAction: () -> Unit)
}