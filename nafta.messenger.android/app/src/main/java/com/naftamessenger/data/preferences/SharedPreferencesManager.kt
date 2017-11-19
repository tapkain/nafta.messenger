package com.naftamessenger.data.preferences

import android.content.Context
import android.content.SharedPreferences
import org.jetbrains.anko.defaultSharedPreferences
import javax.inject.Inject

/**
 * Created by bohdan on 10/16/17
 */
class SharedPreferencesManager @Inject constructor() {

	private val PREF_USERNAME = "PREF_USERNAME"
	private val PREF_PASSWORD = "PREF_PASSWORD"
	private val PREF_TOKEN = "PREF_TOKEN"

	private lateinit var sharedPreferences: SharedPreferences

	var username
		get() = sharedPreferences.getString(PREF_USERNAME, "")
		set(value) = sharedPreferences.edit().putString(PREF_USERNAME, value).apply()

	var password
		get() = sharedPreferences.getString(PREF_PASSWORD, "")
		set(value) = sharedPreferences.edit().putString(PREF_PASSWORD, value).apply()

	var token
		get() = sharedPreferences.getString(PREF_TOKEN, "")
		set(value) = sharedPreferences.edit().putString(PREF_TOKEN, value).apply()

	@Inject
	fun initSharedPreferences(context: Context) {
		sharedPreferences = context.defaultSharedPreferences
	}
}