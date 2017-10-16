package com.naftamessenger.data.database

import android.arch.persistence.room.Dao
import android.arch.persistence.room.Insert
import android.arch.persistence.room.OnConflictStrategy
import android.arch.persistence.room.Query
import com.naftamessenger.data.models.Message

/**
 * Created by bohdan on 10/16/17
 */
@Dao
interface MessagesDao {

	@Insert(onConflict = OnConflictStrategy.REPLACE)
	fun insertMessages(messages: List<Message>)

	@Query("SELECT * FROM messages" +
			" WHERE user_sender_id = :arg0" +
			" OR user_receiver_id = :arg0" +
			" ORDER BY send_timestamp")
	fun getMessages(conversationalistId: Int): Array<Message>

	@Query("SELECT MAX(send_timestamp) FROM messages")
	fun getLastMessageTimestamp(): Int
}