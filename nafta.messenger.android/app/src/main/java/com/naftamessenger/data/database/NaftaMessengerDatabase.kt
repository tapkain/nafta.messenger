package com.naftamessenger.data.database

import android.arch.persistence.room.Database
import android.arch.persistence.room.RoomDatabase
import com.naftamessenger.data.models.Message

/**
 * Created by bohdan on 10/16/17
 */
@Database(entities = arrayOf(Message::class), version = 1, exportSchema = false)
abstract class NaftaMessengerDatabase : RoomDatabase() {

	companion object {
		const val DATABASE_NAME = "nafta_messenger_db"
	}

	abstract fun messagesDao(): MessagesDao
}