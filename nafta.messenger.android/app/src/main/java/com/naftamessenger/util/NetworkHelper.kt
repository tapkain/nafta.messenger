package com.naftamessenger.util

import android.content.Context
import android.net.ConnectivityManager
import com.naftamessenger.NaftaMessengerApp

/**
 * Created by Bohdan.Shvets on 05.10.2017
 */

fun isNetworkAvailable(): Boolean {
	val connectivityManager = NaftaMessengerApp.applicationComponent.context().getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
	val activeNetworkInfo = connectivityManager.activeNetworkInfo
	return activeNetworkInfo != null && activeNetworkInfo.isConnected
}