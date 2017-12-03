package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.presenter.RegisterPresenter
import kotlinx.android.synthetic.main.activity_register.*
import org.jetbrains.anko.startActivity
import javax.inject.Inject

/**
 * Created by Bohdan on 19.11.2017
 */
class RegisterActivity : AppCompatActivity(), RegisterView {

	@Inject
	lateinit var presenter: RegisterPresenter

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_register)

		NaftaMessengerApp.applicationComponent.inject(this)

		btnLogin.setOnClickListener {
			startActivity<LoginActivity>()
			finish()
		}

		presenter.onBind(this)
	}

	override fun setRegisterAction(action: () -> Unit) = btnRegister.setOnClickListener { action() }

	override fun getEmail() = etEmail.text.toString()
	override fun getPassword() = etPassword.text.toString()
	override fun getConfirmPassword() = etConfirmPassword.text.toString()
	override fun getName() = etName.text.toString()
	override fun getSurname() = etSurname.text.toString()

	override fun onLoginSuccess() {
		startActivity<MainActivity>()
		finish()
	}
}