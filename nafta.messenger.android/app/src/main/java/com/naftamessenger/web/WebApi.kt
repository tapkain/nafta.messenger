package com.naftamessenger.web

import com.naftamessenger.data.models.dto.RegistrationModel
import com.naftamessenger.data.models.dto.TokenModel
import retrofit2.Call
import retrofit2.http.Headers
import retrofit2.http.POST
import retrofit2.http.Query

/**
 * Created by Bohdan on 19.11.2017
 */
interface WebApi {

	@POST("token")
	@Headers("Content-Type: application/x-www-form-urlencoded")
	fun login(@Query("gran_type") grantType: String = "password", @Query("username") email: String, @Query("password") password: String): Call<TokenModel>

	@POST("api/account/register")
	fun register(@Query("model") model: RegistrationModel): Call<String>
}