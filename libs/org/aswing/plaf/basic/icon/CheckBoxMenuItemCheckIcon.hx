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
	import org.aswing.graphics.Pen;
	/**
 * @private
 */
class CheckBoxMenuItemCheckIcon extends MenuCheckIcon{
	
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
			g.beginDraw(new Pen(c.getMideground(), 2));
			g.moveTo(x, y+4);
			g.lineTo(x+3, y+7);
			g.lineTo(x+8, y+2);
			g.endDraw();
		}
		shape.filters =
			[new BevelFilter(1, 90, 0x0, 0, 0xFFFFFF, 1, 1, 1, 1, 1, BitmapFilterType.OUTER)];
	}
	
	override public function getDisplay(c:Component):DisplayObject{
		return shape;
	}
}