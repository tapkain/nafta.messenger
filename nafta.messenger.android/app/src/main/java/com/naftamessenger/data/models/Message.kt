package com.naftamessenger.data.models

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

/**
 * Created by bohdan on 10/16/17
 */
@Entity(tableName = "messages")
class Message {

	@PrimaryKey
	@ColumnInfo(name = "message_id")
	var messageId: Int = 0
	@ColumnInfo(name = "user_sender_id")
	var userSenderId: Int = 0
	@ColumnInfo(name = "user_receiver_id")
	var userReceiverId: Int = 0

	@ColumnInfo(name = "text_content")
	lateinit var textContent: String
	@ColumnInfo(name = "send_timestamp")
	var sendTimestamp: Int = 0
}