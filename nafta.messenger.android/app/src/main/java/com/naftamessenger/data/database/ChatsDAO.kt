package com.naftamessenger.data.database

import android.arch.persistence.room.Dao
import android.arch.persistence.room.Insert
import android.arch.persistence.room.OnConflictStrategy
import android.arch.persistence.room.Query
import com.naftamessenger.data.models.local.Chat

/**
 * Created by Bohdan on 03.12.2017
 */
@Dao
interface ChatsDAO {

	@Insert(onConflict = OnConflictStrategy.REPLACE)
	fun insertChats(chats: List<Chat>)

	@Query("DELETE FROM chats")
	fun clearChats()

	@Query("SELECT * FROM chats")
	fun getChats(): List<Chat>
}