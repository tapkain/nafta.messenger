package com.naftamessenger.web

import com.google.gson.GsonBuilder
import com.naftamessenger.BuildConfig
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

/**
 * Created by Bohdan on 19.11.2017
 */
object WebApiBuilder {

	private val BASE_URL = "http://tapkain-001-site1.etempurl.com/"

	private val DATE_FORMAT = "EEE, dd MMM yyyy HH:mm:ss zzz"

	fun createWebApi(): WebApi {
		val clientBuilder = OkHttpClient.Builder()

		if (BuildConfig.DEBUG)
			clientBuilder.addInterceptor(HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY))

		val gson = GsonBuilder()
				.setDateFormat(DATE_FORMAT)
				.create()

		val builder = Retrofit.Builder()
				.baseUrl(BASE_URL)
				.client(clientBuilder.build())
				.addConverterFactory(GsonConverterFactory.create(gson))
				.build()

		return builder.create(WebApi::class.java)
	}

}