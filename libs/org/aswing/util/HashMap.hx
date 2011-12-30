/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.util;


import flash.errors.Error;
import flash.utils.TypedDictionary; 
/**
 * To successfully store and retrieve (key->value) mapping from a HashMap.
 * HashMap accept any type of object to be the key: number, string, Object etc... 
 * But it is only get fast accessing with string type keys. Others are slow.
 * <p>
 * ----------------------------------------------------------
 * This example creates a HashMap of friends. It uses the number of the friends as keys:
 * <listing>
 *     function person(name,age,sex){
 *         this.name=name;
 *         this.age=age;
 *         this.sex=sex;
 *     }
 *     var friends = new HashMap();
 *     friends.put("one", new person("paling",21,"M"));
 *     friends.put("two", new person("gothic man",22,"M"));
 *     friends.put("three", new person("rock girl",19,"F"));
 * </listing>
 * </p>
 * <p>To retrieve a friends, use the following code:
 *
 * <listing>
 *     var thisperson = friends.get("two");
 *     if (thisperson != null) {
 *         trace("two name is "+thisperson.name);
 *         trace("two age is "+thisperson.age);
 *         trace("two sex is "+thisperson.sex);
 *     }else{
 *         trace("two is not in friends!");
 *     }
 * </listing>
 *</p>
 * @author paling
 */	
class HashMap
{

    private var length:Int;
    private var content:TypedDictionary<Dynamic,Dynamic>;
		
 	public function new(){
        length = 0;
        content = new TypedDictionary<Dynamic,Dynamic>();
 	}

 	//-------------------public methods--------------------

 	/**
  	 * Returns the number of keys in this HashMap.
  	 */
 	public function size():Int{
  		return length;
 	}

 	/**
  	 * Returns if this HashMap maps no keys to values.
  	 */
 	public function isEmpty():Bool{
  		return (length==0);
 	}

 	/**
  	 * Returns an Array of the keys in this HashMap.
  	 */
 	public function keys():Array<Dynamic>{
  	 
  		return content.keys();
 	}
 	
 	/**
 	 * Call func(key) for each key.
 	 * @param func the function to call
 	 */
 	public function eachKey(func:Dynamic -> Void):Void {
		var itr:Array<Dynamic> = content.keys();	
  		for(i in itr){
  			func(i);
  		}
 	}
 	
 	/**
 	 * Call func(value) for each value.
 	 * @param func the function to call
 	 */ 	
 	public function eachValue(func:Dynamic -> Void):Void{
  		var itr:Iterator<Dynamic> = content.iterator();	
  		for(i in itr){
  			func( content.get(i) );
  		}
 	}
 	
 	/**
  	 * Returns an Array of the values in this HashMap.
  	 */
 	public function values():Array<Dynamic>{
  		var temp:Array<Dynamic>= new Array<Dynamic>();
  		var index:Int= 0;
  		var itr:Iterator<Dynamic> =  content.iterator();	
  		for (i in itr) {
		 	
   			temp[index] = content.get(i);
   			index ++;
  		}
  		return temp;
 	}
 	
 	/**
  	 * Tests if some key maps into the specified value in this HashMap. 
  	 * This operation is more expensive than the containsKey method.
  	 */
 	public function containsValue(value:Dynamic):Bool{
  		var itr:Iterator<Dynamic> = content.iterator();	
  		for(i in itr){
   			if(i == value){
    			return true;
   			}
  		}
 		return false;
 	}

 	/**
  	 * Tests if the specified object is a key in this HashMap.
  	 * This operation is very fast if it is a string.
     * @param   key   The key whose presence in this map is to be tested
     * @return <tt>true</tt> if this map contains a mapping for the specified
  	 */
 	public function containsKey(key:Dynamic ):Bool {
	//untyped dict[key] = n;	
 		if(  content.get(key) != null){
 			return true;
 		}
  		return false;
 	}

 	/**
 	 * Returns the value to which the specified key is mapped in this HashMap.
 	 * Return null if the key is not mapped to any value in this HashMap.
  	 * This operation is very fast if the key is a string.
     * @param   key the key whose associated value is to be returned.
     * @return  the value to which this map maps the specified key, or
     *          <tt>null</tt> if the map contains no mapping for this key
     *           or it is null value originally.
 	 */
 	public function get(key:Dynamic):Dynamic{
 		var value:Dynamic=content.get(key);
 		if(value !=null){
 			return value;
 		}
  		return null;
 	}
 	
 	/**
 	 * Same functionity method with different name to <code>get</code>.
 	 * 
     * @param   key the key whose associated value is to be returned.
     * @return  the value to which this map maps the specified key, or
     *          <tt>null</tt> if the map contains no mapping for this key
     *           or it is null value originally.
 	 */
 	public function getValue(key:Dynamic):Dynamic{
 		return get(key);
 	}

 	/**
 	 * Associates the specified value with the specified key in this map. 
 	 * If the map previously contained a mapping for this key, the old value is replaced. 
 	 * If value is null, means remove the key from the map.
     * @param key key with which the specified value is to be associated.
     * @param value value to be associated with the specified key. null to remove the key.
     * @return previous value associated with specified key, or <tt>null</tt>
     *	       if there was no mapping for key.  A <tt>null</tt> return can
     *	       also indicate that the HashMap previously associated
     *	       <tt>null</tt> with the specified key.
  	 */
 	public function put(key:Dynamic, value:Dynamic):Dynamic{
  		if(key == null){
   			throw new  Error("cannot put a value with undefined or null key!");
   			return null;
  		}else if(value == null){
  			return remove(key);
  		}else{
  			var exist:Bool= containsKey(key);
 			if(exist!=true){
   				length++;
 			}
 			var oldValue:Dynamic= this.get(key);
   			content.set(key,value);
   			return oldValue;
  		}
 	}

 	/**
     * Removes the mapping for this key from this map if present.
     *
     * @param  key key whose mapping is to be removed from the map.
     * @return previous value associated with specified key, or <tt>null</tt>
     *	       if there was no mapping for key.  A <tt>null</tt> return can
     *	       also indicate that the map previously associated <tt>null</tt>
     *	       with the specified key.
  	 */
 	public function remove(key:Dynamic):Dynamic{
 		var exist:Bool= containsKey(key);
 		if(exist!=true){
 			return null;
 		}
  		var temp:Dynamic=  content.get(key);
   		// delete content[key];
		content.delete(key); 
   		length--;
  		return temp;
 	}
 	
 	/**
 	 * Clears this HashMap so that it contains no keys no values.
 	 */
 	public function clear():Void{
  		length = 0;
  		content = new TypedDictionary<Dynamic,Dynamic>();
 	}

 	/**
 	 * Return a same copy of HashMap object
 	 */
 	public function clone():HashMap{
  		var temp:HashMap = new HashMap();
  		var itr:Iterator<Dynamic> =  content.iterator();	
  		for(i in itr){
   			temp.put( content.get(i),  content.get(i));
  		}
  		return temp;
 	}

 	public function toString():String{
  		var ks:Array<Dynamic>= keys();
  		var vs:Array<Dynamic>= values();
  		var temp:String= "HashMap Content:\n";
  		for(i in 0...ks.length){
   			temp += ks[i]+" -> "+vs[i] + "\n";
  		}
  		return temp;
 	}		
}