/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.util;

	
import flash.utils.TypedDictionary;
	
/**
 * A collection that contains no duplicate elements. More formally, 
 * sets contain no pair of elements e1 and e2 such that e1 == e2.
 * @author paling
 */
class HashSet
{
	
	private var container:TypedDictionary<Dynamic,Dynamic>;
	private var length:Int;
	
	public function new(){
		container = new TypedDictionary<Dynamic,Dynamic>();
		length = 0;
	}
	
	public function size():Int{
		return length;
	}
	
	public function add(o:Dynamic):Void{
		if(!contains(o)){
			length++;
		}
		  container.set(o,o);
	}
	
	public function contains(o:Dynamic):Bool{
		return   container.get(o) !=null;
	}
	
	public function isEmpty():Bool{
		return length == 0;
	}
	
	public function remove(o:Dynamic):Bool{
		if(contains(o)){
			// delete container[o];
			container.delete(o);
			length--;
			return true;
		}else{
			return false;
		}
	}
	
	public function clear():Void{
		container = new TypedDictionary<Dynamic,Dynamic>();
		length = 0;
	}
	
	public function addAll(arr:Array<Dynamic>):Void{
		for (i in arr ){
			add(i);
		}
	}
	
	public function removeAll(arr:Array<Dynamic>):Void{
		for (i in arr ){
			remove(i);
		}
	}
	
	public function containsAll(arr:Array<Dynamic>):Bool{
		for(i in 0...arr.length){
			if(!contains(arr[i])){
				return false;
			}
		}
		return true;
	}
	
	public function each(func:Dynamic -> Void):Void{
		var itr:Array<Dynamic> = container.keys();	
  		for(i in itr){	
			func(i);
		}
	}
	
	public function toArray():Array<Dynamic>{
		var arr:Array<Dynamic>= new Array<Dynamic>();
		var index:Int= 0;
		var itr:Array<Dynamic>  =  container.keys();	
  		for(i in itr){	
			arr[index] = i;
			index ++;
		}
		return arr;
	}
}