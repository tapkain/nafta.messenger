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
	var bornDate: Date = Date()
	var phoneNumber = ""
	var registrationDate: Date = Date()
}