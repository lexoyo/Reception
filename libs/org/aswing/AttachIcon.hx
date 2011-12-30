/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing;

import flash.display.DisplayObject;
import flash.display.Loader;
import haxe.io.Error;
import org.aswing.event.AttachEvent;
import org.aswing.graphics.Graphics2D;
import flash.display.Sprite;
import flash.system.ApplicationDomain;

/**
 * Attach a displayObject from library with the linkage name to be a icon.
 * @author senkay
 * @author paling
 */
class AttachIcon extends AssetIcon{
	
	private var applicationDomain:ApplicationDomain;
	private var className:String;
	
	/**
	 * Attach a mc from library to be a icon.<br>
	 * If speciaficed the width and height, the mc will be scale to be this size if scale setted true.
	 * else the width and height will be the symbol's width and height.
	 * @param linkage the linkageID of the symbol to attach
	 * @param loader the loaderObject with attach symbol,if loader is null then loader is root
	 * @param width (optional)if you specifiled the width of the Icon, and scale is true,
	 * the mc will be scale to this width when paint.
	 * @param height (optional)if you specifiled the height of the Icon, and scale is true, 
	 * the mc will be scale to this height when paint.
	 * @param scale (optional)whether scale MC to fix the width and height specified. Default is true
	 */
	public function new(assetClassName:String, applicationDomain:ApplicationDomain=null, width:Int=-1, height:Int=-1, scale:Bool=false){
		super(getAttachDisplayObject(assetClassName, applicationDomain), width, height, scale);
	}
	
	/**
	 * return the attach displayObject
	 * if cannot create from Class then return null
	 */
	private function getAttachDisplayObject(assetClassName:String, ad:ApplicationDomain):DisplayObject{
		className = assetClassName;
		applicationDomain = (ad == null ? ApplicationDomain.currentDomain : ad);
		var classReference:Class<Dynamic>;
		try{
			classReference = flash.Lib.as(applicationDomain.getDefinition(className) , Class);
		}catch(e:Error){
			return null;
		}
		var attachMC:DisplayObject = flash.Lib.as(Type.createInstance( classReference,[]) , DisplayObject);
		return attachMC;
	}
}