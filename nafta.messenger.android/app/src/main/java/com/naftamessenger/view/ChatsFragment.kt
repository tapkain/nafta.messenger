package com.naftamessenger.view

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.DividerItemDecoration
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.naftamessenger.NaftaMessengerApp
import com.naftamessenger.R
import com.naftamessenger.data.models.local.Chat
import com.naftamessenger.presenter.ChatsPresenter
import kotlinx.android.synthetic.main.fragment_chats.*
import kotlinx.android.synthetic.main.list_item_chat.view.*
import javax.inject.Inject

/**
 * Created by Bohdan on 30.11.2017
 */
class ChatsFragment : Fragment(), ChatsView {

	@Inject
	lateinit var chatsPresenter: ChatsPresenter

	override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View = inflater.inflate(R.layout.fragment_chats, container, false)

	override fun onStart() {
		super.onStart()
		NaftaMessengerApp.applicationComponent.inject(this)

		recyclerView.addItemDecoration(DividerItemDecoration(activity, (recyclerView.layoutManager as LinearLayoutManager).orientation))

		chatsPresenter.onBind(this)
	}

	override fun setChats(chats: List<Chat>) {
		recyclerView.adapter = ChatsAdapter(chats)
	}

	private class ChatsAdapter(private val chats: List<Chat>) : RecyclerView.Adapter<ChatsAdapter.ChatViewHolder>() {

		override fun onBindViewHolder(holder: ChatViewHolder?, position: Int) {
			holder?.itemView?.tvChatName?.text = chats[position].name
			holder?.itemView?.tvChatChar?.text = chats[position].name[0].toUpperCase().toString()
		}

		override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): ChatViewHolder =
				ChatViewHolder(LayoutInflater.from(parent?.context).inflate(R.layout.list_item_chat, parent, false))

		override fun getItemCount(): Int = chats.size

		class ChatViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView)
	}
}