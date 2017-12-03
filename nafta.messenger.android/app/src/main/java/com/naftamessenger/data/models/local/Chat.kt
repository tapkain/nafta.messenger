package com.naftamessenger.data.models.local

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey
import com.google.gson.annotations.SerializedName

/**
 * Created by Bohdan on 19.11.2017
 */
@Entity(tableName = "chats")
class Chat {

	@PrimaryKey
	@SerializedName("Id")
	var id = 0
	@SerializedName("Name")
	var name = ""
	@SerializedName("CreationDate")
	var creationDate = ""
}