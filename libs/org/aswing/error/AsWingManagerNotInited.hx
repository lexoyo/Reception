/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.error;

import flash.errors.Error;
/**
 * The error indicated that the operation you are doing shuold be after 
 * <code>AsWingManager.setRoot(a root)</code>.
 * 
 * @see org.aswing.AsWingManager
 * @author paling
 */
class AsWingManagerNotInited extends Error{
	
	public function new()
	{
		super("You have not call AsWingManager.setRoot() yet!");
	}
	
}