package com.naftamessenger.data.models.local

import com.google.gson.annotations.SerializedName
import java.util.*

/**
 * Created by Bohdan on 19.11.2017
 */
class Message {

	@SerializedName("Id")
	var id = 0
	@SerializedName("Text")
	var text = ""
	@SerializedName("UserId")
	var userId = ""
	@SerializedName("ChatId")
	var chatId = 0
	var time: Date? = null
}