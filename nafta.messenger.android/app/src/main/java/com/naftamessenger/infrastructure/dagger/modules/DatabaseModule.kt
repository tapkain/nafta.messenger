package com.naftamessenger.infrastructure.dagger.modules

import android.arch.persistence.room.Room
import android.content.Context
import com.naftamessenger.data.database.NaftaMessengerDatabase
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

/**
 * Created by bohdan on 10/16/17
 */
@Module
class DatabaseModule {

	@Provides
	@Singleton
	fun provideDatabase(context: Context): NaftaMessengerDatabase {
		return Room.databaseBuilder(context, NaftaMessengerDatabase::class.java, NaftaMessengerDatabase.DATABASE_NAME).build()
	}
}