package com.naftamessenger.infrastructure.dagger.modules

import android.content.Context
import com.naftamessenger.NaftaMessengerApp
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

/**
 * Created by bohdan on 10/16/17
 */
@Module
class ApplicationModule(private val application: NaftaMessengerApp) {

	@Provides
	@Singleton
	fun provideApplicationContext(): Context {
		return application
	}

	@Provides
	@Singleton
	fun provideApplication(): NaftaMessengerApp {
		return application
	}
}