package com.naftamessenger.data.models.local

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

/**
 * Created by Bohdan on 19.11.2017
 */
@Entity(tableName = "users")
class User {

	@PrimaryKey
	var id = ""
	var username = ""
	var sex = ""
	var name = ""
	var surname = ""
	var bornDate = ""
	var phoneNumber = ""
}