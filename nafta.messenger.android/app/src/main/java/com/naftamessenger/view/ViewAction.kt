package com.naftamessenger.view

/**
 * Created by Bohdan on 03.12.2017
 */

typealias ViewAction = () -> Unit

typealias ParametrizedViewAction<T, R> = (T) -> R