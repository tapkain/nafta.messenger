package com.naftamessenger.data.models.dto

import com.google.gson.annotations.SerializedName

/**
 * Created by Bohdan on 19.11.2017
 */
class TokenModel {

	@SerializedName("access_token")
	var accessToken = ""
	@SerializedName(".expires")
	var expiresAt = ""
	@SerializedName("expires_in")
	var expiresIn = 0
	@SerializedName(".issued")
	var issuedAt = ""
	@SerializedName("token_type")
	var tokenType = ""
	@SerializedName("userName")
	var username = ""
}