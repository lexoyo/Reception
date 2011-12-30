/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.plaf.basic.icon;

	
import flash.display.Shape;
	import flash.display.DisplayObject;
	import flash.filters.BevelFilter;
import flash.filters.BitmapFilterType;

import org.aswing.Component;
	import org.aswing.AbstractButton;
	import org.aswing.graphics.Graphics2D;
	import org.aswing.graphics.SolidBrush;
	/**
 * @private
 */
class RadioButtonMenuItemCheckIcon extends MenuCheckIcon{
	
	private var shape:Shape;
	
	public function new(){
		shape = new Shape();
		super();
	}
	
	override public function updateIcon(c:Component, g:Graphics2D, x:Int, y:Int):Void{
		shape.graphics.clear();
		g = new Graphics2D(shape.graphics);
		var menu:AbstractButton = flash.Lib.as(c,AbstractButton);
		if(menu.isSelected()){
			g.fillCircle(new SolidBrush(c.getMideground()), x+4, y+5, 3);
		}
		shape.filters = 
			[new BevelFilter(1, 80, 0x0, 0, 0xFFFFFF, 1, 1, 1, 1, 1, BitmapFilterType.OUTER)];
	}
	
	override public function getDisplay(c:Component):DisplayObject{
		return shape;
	}
}