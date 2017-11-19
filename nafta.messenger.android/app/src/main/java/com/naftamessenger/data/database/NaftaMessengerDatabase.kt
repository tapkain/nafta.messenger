package com.naftamessenger.data.database

import android.arch.persistence.room.Database
import android.arch.persistence.room.RoomDatabase
import com.naftamessenger.data.models.local.Chat
import com.naftamessenger.data.models.local.Message
import com.naftamessenger.data.models.local.User

/**
 * Created by bohdan on 10/16/17
 */
@Database(entities = arrayOf(Chat::class, User::class, Message::class), version = 1, exportSchema = false)
abstract class NaftaMessengerDatabase : RoomDatabase() {

	companion object {
		const val DATABASE_NAME = "nafta_messenger_db"
	}
}