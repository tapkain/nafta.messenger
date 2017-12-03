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
	fun register(@Body model: RegistrationModel): Call<Unit>

	@GET("api/chats")
	fun getChats(@Header("Authorization") token: String): Call<List<Chat>>

	@POST("api/chats/{chatId}/send")
	fun sendMessage(@Path("chatId") chaId: Int, @Body message: MessageModel, @Header("Authorization") token: String)

	@GET("api/chats/{chatId}/messages")
	fun getMessages(@Path("chatId") chatId: Int, @Header("Authorization") token: String): Call<List<Message>>

	@GET("api/users/current")
	fun getCurrent(@Header("Authorization") token: String): Call<User>

	@GET("api/friends")
	fun getFriends(@Header("Authorization") token: String): Call<List<User>>

	@GET("api/users/{id}")
	fun getUserById(@Path("id") id: Int, @Header("Authorization") token: String): Call<User>

	@GET("api/users")
	fun getAllUsers(@Header("Authorization") token: String): Call<List<User>>

	@GET("api/chats/create/{chatName}/{userId}")
	fun createChat(chatName: String, userId: String, @Header("Authorization") token: String): Call<List<User>>
}