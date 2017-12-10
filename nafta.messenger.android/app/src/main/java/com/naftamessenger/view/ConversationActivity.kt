package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.RecyclerView
import android.view.*
import android.view.View
import android.widget.TextView
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.data.models.local.Message
import com.naftamessenger.presenter.ConversationPresenter
import com.naftamessenger.view.View.Companion.EXTRA_CHAT_ID
import kotlinx.android.synthetic.main.activity_conversation.*
import javax.inject.Inject

/**
 * Created by Bohdan on 03.12.2017
 */
class ConversationActivity : AppCompatActivity(), ConversationView {

	@Inject
	lateinit var presenter: ConversationPresenter

	private lateinit var isMeAction: ParametrizedViewAction<String, Boolean>
	private lateinit var syncAction: ViewAction
	private lateinit var sendMessageAction: ParametrizedViewAction<String, Unit>

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_conversation)
		NaftaMessengerApp.applicationComponent.inject(this)

		presenter.onBind(this)

		ivSend.setOnClickListener {
			sendMessageAction(editText.text.toString())
			editText.text = null
		}
	}

	override fun setMessages(messages: List<Message>) {
		recyclerView.adapter = MessagesAdapter(messages)
	}

	override fun setIsMeAction(action: ParametrizedViewAction<String, Boolean>) {
		isMeAction = action
	}

	override fun setChatName(chatName: String) {
		supportActionBar?.title = chatName
	}

	override fun getChatId() = intent.getIntExtra(EXTRA_CHAT_ID, 0)

	override fun setSyncAction(syncAction: ViewAction) {
		this.syncAction = syncAction
	}

	override fun setSendMessageAction(sendMessageAction: ParametrizedViewAction<String, Unit>) {
		this.sendMessageAction = sendMessageAction
	}

	override fun onCreateOptionsMenu(menu: Menu?): Boolean {
		menuInflater.inflate(R.menu.main_menu, menu)
		return true
	}

	override fun onOptionsItemSelected(item: MenuItem?): Boolean {
		syncAction()
		return true
	}

	private inner class MessagesAdapter(private val messages: List<Message>) : RecyclerView.Adapter<MessagesAdapter.ViewHolder>() {

		private val VIEW_TYPE_MINE = 1
		private val VIEW_TYPE_FRIEND = 2

		override fun onBindViewHolder(holder: ViewHolder, position: Int) {
			holder.message = messages[position].text
		}

		override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder = when (viewType) {
			VIEW_TYPE_MINE -> ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.list_item_message_mine, parent, false))
			VIEW_TYPE_FRIEND -> ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.list_item_message_friend, parent, false))

			else -> ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.list_item_message_mine, parent, false))
		}

		override fun getItemViewType(position: Int) = if (isMeAction(messages[position].userId)) VIEW_TYPE_MINE else VIEW_TYPE_FRIEND

		override fun getItemCount() = messages.size

		inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
			var message
				get() = itemView.findViewById<TextView>(R.id.tvMessageText).text
				set(value) {
					itemView.findViewById<TextView>(R.id.tvMessageText).text = value
				}
		}
	}
}