package com.naftamessenger.data.models.local

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey
import com.google.gson.annotations.SerializedName

/**
 * Created by Bohdan on 19.11.2017
 */
@Entity(tableName = "users")
class User {

	@PrimaryKey
	@SerializedName("Id")
	var id = ""
	@SerializedName("Email")
	var username = ""
	@SerializedName("Sex")
	var sex = ""
	@SerializedName("Name")
	var name = ""
	@SerializedName("Surname")
	var surname = ""
	@SerializedName("BornDate")
	var bornDate = ""
	@SerializedName("PhoneNumber")
	var phoneNumber = ""
}