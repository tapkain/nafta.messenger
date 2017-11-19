package com.naftamessenger.data.models.dto

import java.util.*

/**
 * Created by Bohdan on 19.11.2017
 */
class RegistrationModel {
	var email = ""
	var password = ""
	var confirmPassword = ""
	var name = ""
	var surname = ""
	var sex = ""
	var bornDate: Date? = null
	var phoneNumber = ""
	var registrationDate: Date? = null
}