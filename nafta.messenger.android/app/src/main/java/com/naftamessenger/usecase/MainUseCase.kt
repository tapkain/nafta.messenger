package com.naftamessenger.usecase

import com.naftamessenger.data.preferences.SharedPreferencesManager
import javax.inject.Inject

/**
 * Created by bohdan on 10/16/17
 */
class MainUseCase @Inject constructor(private val sharedPreferencesManager: SharedPreferencesManager) {

	fun isLoggedIn(): Boolean = !sharedPreferencesManager.token.isEmpty()
}