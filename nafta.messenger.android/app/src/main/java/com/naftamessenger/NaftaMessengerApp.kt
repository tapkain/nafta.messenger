package com.naftamessenger

import android.app.Application
import com.naftamessenger.infrastructure.dagger.components.ApplicationComponent
import com.naftamessenger.infrastructure.dagger.components.DaggerApplicationComponent
import com.naftamessenger.infrastructure.dagger.modules.ApplicationModule
import com.naftamessenger.infrastructure.dagger.modules.DatabaseModule

/**
 * Created by bohdan on 10/16/17
 */
class NaftaMessengerApp : Application() {

	companion object {
		lateinit var applicationComponent: ApplicationComponent
	}

	override fun onCreate() {
		super.onCreate()

		applicationComponent = DaggerApplicationComponent.builder()
				.applicationModule(ApplicationModule(this))
				.build()
	}
}