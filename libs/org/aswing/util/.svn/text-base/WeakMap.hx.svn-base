package org.aswing.util;


import flash.utils.Dictionary;

/**
 * A map that both key and value are weaks.
 */
class WeakMap{
	
	private var dic:Dictionary;
	
	public function new(){
	 
		dic = new Dictionary(true);
	}
	
	public function put(key:Dynamic, value:Dynamic):Void{
		var wd:Dictionary = new Dictionary(true);
		untyped wd[value] = null;
		untyped dic[key] = wd;
	}
	
	public function getValue(key:Dynamic):Dynamic{
		var wd:Dictionary = untyped dic[key];
		if (wd != null)	{
			var itr:Iterator<Dynamic> = untyped __keys__(wd).iterator();	  	 
			for(v in itr){
				return v;
			}
		}
		return null;
	}
	
	public function remove(key:Dynamic):Dynamic{
		var value:Dynamic= getValue(key);
		// delete dic[key];
		return value;
	}
}