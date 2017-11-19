package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.presenter.LoginPresenter
import kotlinx.android.synthetic.main.activity_login.*
import org.jetbrains.anko.startActivity
import javax.inject.Inject

/**
 * Created by Bohdan.Shvets on 17.10.2017
 */
class LoginActivity : AppCompatActivity(), LoginView {

	@Inject
	lateinit var loginPresenter: LoginPresenter

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_login)
		NaftaMessengerApp.applicationComponent.inject(this)

		btnRegister.setOnClickListener {
			startActivity<RegisterActivity>()
			finish()
		}

		loginPresenter.onBind(this)
	}

	override fun setLoginAction(loginAction: () -> Unit) {
		btnLogin.setOnClickListener { loginAction() }
	}
}