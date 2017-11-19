package com.naftamessenger.web

import com.naftamessenger.BuildConfig
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

/**
 * Created by Bohdan on 19.11.2017
 */
class WebApiBuilder {

	private val BASE_URL = "http://tapkain-001-site1.etempurl.com/"

	fun createWebApi(): WebApi {

		val clientBuilder = OkHttpClient.Builder()

		if (BuildConfig.DEBUG)
			clientBuilder.addInterceptor(HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY))

		val builder = Retrofit.Builder()
				.baseUrl(BASE_URL)
				.client(clientBuilder.build())
				.addConverterFactory(GsonConverterFactory.create())
				.build()

		return builder.create(WebApi::class.java)
	}

}