package com.naftamessenger.infrastructure.dagger.components

import android.content.Context
import com.naftamessenger.infrastructure.dagger.modules.ApplicationModule
import com.naftamessenger.infrastructure.dagger.modules.DatabaseModule
import com.naftamessenger.view.LoginActivity
import com.naftamessenger.view.MainActivity
import dagger.Component
import javax.inject.Singleton

/**
 * Created by bohdan on 10/16/17
 */
@Singleton
@Component(modules = arrayOf(ApplicationModule::class, DatabaseModule::class))
interface ApplicationComponent {

	fun context(): Context

	fun inject(mainActivity: MainActivity)
	fun inject(mainActivity: LoginActivity)
}