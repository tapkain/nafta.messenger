package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.presenter.MainPresenter
import org.jetbrains.anko.startActivity
import javax.inject.Inject

class MainActivity : AppCompatActivity(), MainView {

	@Inject
	lateinit var mainPresenter: MainPresenter

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_main)
		NaftaMessengerApp.applicationComponent.inject(this)

		mainPresenter.onBind(this)
	}

	override fun startLogin() {
		startActivity<LoginActivity>()
		finish()
	}
}
