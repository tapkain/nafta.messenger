package com.naftamessenger.presenter

import com.naftamessenger.usecase.AccountUseCase
import com.naftamessenger.usecase.DownloadAllDataUseCase
import com.naftamessenger.util.isNetworkAvailable
import com.naftamessenger.view.MainView
import org.jetbrains.anko.doAsync
import org.jetbrains.anko.uiThread
import javax.inject.Inject

/**
 * Created by bohdan on 10/16/17
 */
class MainPresenter @Inject constructor(private val accountUseCase: AccountUseCase, private val downloadAllDataUseCase: DownloadAllDataUseCase) : Presenter<MainView> {

	private lateinit var mainView: MainView

	override fun onBind(view: MainView) {
		mainView = view

		if (!accountUseCase.isLoggedIn()) {
			mainView.startLogin()
			return
		}

		mainView.setLogoutAction {
			accountUseCase.logout()
			mainView.startLogin()
			doAsync {
				downloadAllDataUseCase.clearAllData()
			}
		}

		mainView.setSyncAction {
			if (!isNetworkAvailable())
				return@setSyncAction

			doAsync {
				downloadAllDataUseCase.downloadChats()
				downloadAllDataUseCase.downloadUsers()

				uiThread {
					mainView.reloadView()
				}
			}
		}
	}

	override fun onUnbind() {}

}