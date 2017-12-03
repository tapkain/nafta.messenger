package com.naftamessenger.data.models.dto

import com.naftamessenger.util.iso8601
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
	var sex = "sex"
	var bornDate: String = Date().iso8601()
	var phoneNumber = "number"
	var registrationDate: String = Date().iso8601()
}