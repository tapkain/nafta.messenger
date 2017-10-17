package com.naftamessenger.presenter

import com.naftamessenger.view.View

/**
 * Created by Bohdan.Shvets on 17.10.2017
 */
interface Presenter<in T : View> {

	fun onBind(view: T)

	fun onUnbind()
}