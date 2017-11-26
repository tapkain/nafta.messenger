package com.naftamessenger.data.models.local

import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

/**
 * Created by Bohdan on 19.11.2017
 */
@Entity
class User {

	@PrimaryKey
	var id = 0
	var username = ""
	var sex = ""
	var name = ""
	var surname = ""
	var bornDate = ""
	var phoneNumber = ""
}