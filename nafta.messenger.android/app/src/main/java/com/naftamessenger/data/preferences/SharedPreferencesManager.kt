package com.naftamessenger.data.preferences

import android.content.Context
import android.content.SharedPreferences
import org.jetbrains.anko.defaultSharedPreferences
import javax.inject.Inject

/**
 * Created by bohdan on 10/16/17
 */
class SharedPreferencesManager @Inject constructor() {

	private val PREF_MAIL = "PREF_MAIL"
	private val PREF_TOKEN = "PREF_TOKEN"
	private val PREF_TOKEN_VALID_DATE = "PREF_TOKEN_VALID_DATE"

	private lateinit var sharedPreferences: SharedPreferences

	var mail
		get() = sharedPreferences.getString(PREF_MAIL, "")
		set(value) = sharedPreferences.edit().putString(PREF_MAIL, value).apply()

	var token
		get() = sharedPreferences.getString(PREF_TOKEN, "")
		set(value) = sharedPreferences.edit().putString(PREF_TOKEN, value).apply()

	var tokenValidDate
		get() = sharedPreferences.getLong(PREF_TOKEN_VALID_DATE, 0)
		set(value) = sharedPreferences.edit().putLong(PREF_TOKEN_VALID_DATE, value).apply()

	@Inject
	protected fun initSharedPreferences(context: Context) {
		sharedPreferences = context.defaultSharedPreferences
	}
}