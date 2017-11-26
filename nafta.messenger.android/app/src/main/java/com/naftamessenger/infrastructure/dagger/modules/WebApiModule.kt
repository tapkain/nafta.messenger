package com.naftamessenger.infrastructure.dagger.modules

import com.naftamessenger.web.WebApi
import com.naftamessenger.web.WebApiBuilder
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

/**
 * Created by Bohdan on 26.11.2017
 */
@Module
class WebApiModule {

	@Provides
	@Singleton
	fun provideWebApi(): WebApi = WebApiBuilder.createWebApi()
}