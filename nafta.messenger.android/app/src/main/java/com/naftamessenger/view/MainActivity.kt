package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.Menu
import android.view.MenuItem
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.presenter.MainPresenter
import kotlinx.android.synthetic.main.activity_main.*
import org.jetbrains.anko.startActivity
import javax.inject.Inject

class MainActivity : AppCompatActivity(), MainView {

	@Inject
	lateinit var mainPresenter: MainPresenter

	private lateinit var logoutAction: ViewAction
	private lateinit var syncAction: ViewAction

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_main)
		NaftaMessengerApp.applicationComponent.inject(this)

		bottomNavigationView.setOnNavigationItemSelectedListener { item ->
			when (item.itemId) {
				R.id.nav_menu -> logoutAction()
				R.id.nav_chats -> supportFragmentManager.beginTransaction().replace(R.id.flFragmentsContainer, ChatsFragment(), "").commitAllowingStateLoss()
			}

			return@setOnNavigationItemSelectedListener true
		}

		mainPresenter.onBind(this)
		bottomNavigationView.selectedItemId = R.id.nav_chats
	}

	override fun onCreateOptionsMenu(menu: Menu?): Boolean {
		menuInflater.inflate(R.menu.main_menu, menu)
		return true
	}

	override fun onOptionsItemSelected(item: MenuItem?): Boolean {
		syncAction()
		return true
	}

	override fun setLogoutAction(logoutAction: ViewAction) {
		this.logoutAction = logoutAction
	}

	override fun setSyncAction(syncAction: ViewAction) {
		this.syncAction = syncAction
	}

	override fun reloadView() {
		bottomNavigationView.selectedItemId = R.id.nav_chats
	}

	override fun startLogin() {
		startActivity<LoginActivity>()
		finish()
	}
}
