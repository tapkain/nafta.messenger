package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.naftamessenger.R
import kotlinx.android.synthetic.main.activity_register.*
import org.jetbrains.anko.startActivity

/**
 * Created by Bohdan on 19.11.2017
 */
class RegisterActivity : AppCompatActivity(), RegisterView {

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_register)

		btnLogin.setOnClickListener {
			startActivity<LoginActivity>()
			finish()
		}

	}
}