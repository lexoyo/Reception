package org.aswing.util;


import flash.utils.TypedDictionary;
	
/**
 * WeakReference, the value will be weak referenced.
 * @author paling
 */
class WeakReference{
	
	private var weakDic:TypedDictionary<Dynamic,Dynamic>;
	
	public function new(){
 
	}
	
	public function set_value(v:Dynamic):Dynamic{
		if(v == null){
			weakDic = null;
		}else{
			weakDic = new TypedDictionary<Dynamic,Dynamic>(true);
			 weakDic.set(v,null);
		}
	
			return v;
		}
	
	public function get_value():Dynamic{
		if (weakDic != null)	{
			var itr:Iterator<Dynamic> = weakDic.keys();	  	 
			for(v in itr){
		 
				return v;
			}
		}
		return null;
	}
	
	/**
	 * Clear the value, same to <code>WeakReference.value=null;</code>
	 */
	public function clear():Void{
		weakDic = null;
	}

		public var value(get_value,set_value):Dynamic;
}