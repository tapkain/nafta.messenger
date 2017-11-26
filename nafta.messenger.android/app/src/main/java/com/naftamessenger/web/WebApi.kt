package com.naftamessenger.web

import com.naftamessenger.data.models.dto.MessageModel
import com.naftamessenger.data.models.dto.RegistrationModel
import com.naftamessenger.data.models.dto.TokenModel
import com.naftamessenger.data.models.local.Chat
import com.naftamessenger.data.models.local.Message
import com.naftamessenger.data.models.local.User
import retrofit2.Call
import retrofit2.http.*

/**
 * Created by Bohdan on 19.11.2017
 */
interface WebApi {

	@POST("token")
	@FormUrlEncoded
	fun login(@Field("grant_type") grantType: String = "password", @Field("username") email: String, @Field("password") password: String): Call<TokenModel>

	@POST("api/account/register")
	fun register(@Body model: RegistrationModel): Call<String>

	@GET("api/chats")
	fun getChats(): Call<Chat>

	@POST("api/chats/{chatId}/send")
	fun sendMessage(@Path("chatId") chaId: Int, @Body message: MessageModel)

	@GET("api/chats/{chatId}/messages")
	fun getMessages(@Path("chatId") chatId: Int): Call<Array<Message>>

	@GET("api/users/current")
	fun getCurrent(): Call<User>

	@GET("api/friends")
	fun getFriends(): Call<Array<User>>

	@GET("api/users/{id}")
	fun getUserById(@Path("id") id: Int): Call<User>
}