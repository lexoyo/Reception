package org.aswing;



import flash.display.DisplayObject;
import org.aswing.graphics.Graphics2D;
import flash.display.SimpleButton;
import flash.filters.ColorMatrixFilter;

class SimpleButtonIcon implements Icon{
	
	private var asset:SimpleButton;
	private var width:Int;
	private var height:Int;
	
	private static var disabledFilters:Array<Dynamic>;
	private static var eabledFilters:Array<Dynamic>= [];
	
	public function new(asset:SimpleButton){
		this.asset = asset;
		width = Math.ceil(asset.width);
		height = Math.ceil(asset.height);
		
		if(disabledFilters == null){
			var cmatrix:Array<Dynamic>= [0.3, 0.59, 0.11, 0, 0, 0.3, 0.59, 0.11, 0, 0, 0.3, 0.59, 0.11, 0, 0, 0, 0, 0, 1, 0];
			disabledFilters = [new ColorMatrixFilter(cmatrix)];			
		}
	}
	
	public function getDisplay(c:Component):DisplayObject{
		return asset;
	}
	
	public function getIconWidth(c:Component):Int{
		return width;
	}
	
	public function getIconHeight(c:Component):Int{
		return height;
	}
	
	public function updateIcon(c:Component, g:Graphics2D, x:Int, y:Int):Void{
		asset.x = x;
		asset.y = y;
		asset.mouseEnabled = c.isEnabled();
		asset.filters = c.isEnabled() ? eabledFilters : disabledFilters;
	}
	
}