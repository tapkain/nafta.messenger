package com.naftamessenger.view

/**
 * Created by Bohdan on 19.11.2017
 */
interface RegisterView: View {

	fun setRegisterAction(action: ViewAction)

	fun getEmail(): String

	fun getPassword(): String

	fun getConfirmPassword(): String

	fun getName(): String

	fun getSurname(): String

	fun onLoginSuccess()
}