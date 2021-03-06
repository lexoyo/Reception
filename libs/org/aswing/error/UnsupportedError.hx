/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.error;

import flash.errors.Error;

/**
 * This error indicates that a function/operation is not supported.
 */
class UnsupportedError extends Error{
	
	public function new(type:String){
		super("This function/operation is not supported!!");
	}
	
}