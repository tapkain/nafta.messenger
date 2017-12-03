package com.naftamessenger.view

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.RecyclerView
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.naftamessenger.R
import com.naftamessenger.data.models.local.Message
import kotlinx.android.synthetic.main.activity_conversation.*

/**
 * Created by Bohdan on 03.12.2017
 */
class ConversationActivity : AppCompatActivity(), ConversationView {

	private lateinit var isMeAction: (Int) -> Boolean

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContentView(R.layout.activity_conversation)
	}

	override fun setMessages(messages: List<Message>) {
		recyclerView.adapter = MessagesAdapter(messages)
	}

	override fun setIsMeAction(action: (Int) -> Boolean) {
		isMeAction = action
	}

	private inner class MessagesAdapter(private val messages: List<Message>) : RecyclerView.Adapter<MessagesAdapter.ViewHolder>() {

		private val VIEW_TYPE_MINE = 1
		private val VIEW_TYPE_FRIEND = 2

		override fun onBindViewHolder(holder: ViewHolder, position: Int) {
			holder.message = messages[position].text
		}

		override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder = when (viewType) {
			VIEW_TYPE_MINE -> ViewHolder(View.inflate(parent.context, R.layout.list_item_message_mine, parent))
			VIEW_TYPE_FRIEND -> ViewHolder(View.inflate(parent.context, R.layout.list_item_message_friend, parent))

			else -> ViewHolder(View.inflate(parent.context, R.layout.list_item_message_mine, parent))
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