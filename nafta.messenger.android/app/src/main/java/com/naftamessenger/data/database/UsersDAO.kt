package com.naftamessenger.data.database

import android.arch.persistence.room.Dao
import android.arch.persistence.room.Insert
import android.arch.persistence.room.OnConflictStrategy
import android.arch.persistence.room.Query
import com.naftamessenger.data.models.local.User

/**
 * Created by Bohdan on 03.12.2017
 */
@Dao
interface UsersDAO {

	@Insert(onConflict = OnConflictStrategy.REPLACE)
	fun insertUsers(users: List<User>): List<Long>

	@Query("DELETE FROM users")
	fun clearUsers()

	@Query("SELECT * FROM users")
	fun getUsers(): List<User>
}