package com.naftamessenger.data.models.local

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

/**
 * Created by Bohdan on 19.11.2017
 */
@Entity(tableName = "messages")
class Message {

	@PrimaryKey
	var id = 0
	var text = ""
	var userId = 0
	var chatId = 0
	var time: Double = 0.0
}