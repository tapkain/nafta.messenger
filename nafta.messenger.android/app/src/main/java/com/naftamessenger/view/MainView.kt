package com.naftamessenger.view

/**
 * Created by Bohdan.Shvets on 17.10.2017
 */
interface MainView : View {

	fun setLogoutAction(logoutAction: ViewAction)

	fun setSyncAction(syncAction: ViewAction)

	fun reloadView()

	fun startLogin()
}