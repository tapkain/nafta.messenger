package com.naftamessenger.util

import java.text.SimpleDateFormat
import java.util.*

/**
 * Created by Bohdan on 30.11.2017
 */

fun Date.iso8601(): String = SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss", Locale.getDefault()).format(this)