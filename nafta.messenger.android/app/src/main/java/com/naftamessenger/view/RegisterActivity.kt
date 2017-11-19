package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.naftamessenger.R

/**
 * Created by Bohdan on 19.11.2017
 */
class RegisterActivity : AppCompatActivity(), RegisterView {

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_register)
	}
}