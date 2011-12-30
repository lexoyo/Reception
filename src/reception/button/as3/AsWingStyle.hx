/*
	This file is part of Reception, which is based on Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package reception.button.as3;

import cocktail.style.StyleData;
import cocktail.unit.UnitData;
import cocktailCore.style.EmbeddedStyle;
import cocktail.domElement.DOMElement;

/**
 * This is the Style class for all AsWing components.
 * It is needed since the properties in AsWing are set/get using methods (setProp / getProp)
 * 
 * @author lexoyo
 */
class AsWingStyle extends EmbeddedStyle
{
	public function new(domElement:DOMElement) 
	{
		super(domElement);
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDES
	//////////////////////////////////////////////////////////////////////////////////////////
	override public function setNativeX(domElement:DOMElement, x:Int):Void
	{
//		super.setNativeX(domElement, x);
		_nativeX = x;
		cast(domElement.nativeElement).setX(x);
	}
	
	override public function setNativeY(domElement:DOMElement, y:Int):Void
	{
//		super.setNativeY(domElement, y);
		_nativeY = y;
		cast(domElement.nativeElement).setY(y);
	}
	
	override public function setNativeWidth(width:Int):Void
	{
//		super.setNativeWidth(width);
		_nativeWidth = width;
		cast(domElement.nativeElement).setWidth(width);
	}
	
	override public function setNativeHeight(height:Int):Void
	{
//		super.setNativeHeight(height);
		_nativeHeight = height;
		cast(domElement.nativeElement).setHeight(height);
	}
	
	override public function setNativeOpacity(opacity:Float):Void
	{
//		super.setNativeOpacity(opacity);
		_nativeOpacity = opacity;
		cast(domElement.nativeElement).setAlpha(opacity);
	}
	
	override public function setNativeVisibility(visible:Bool):Void
	{
//		super.setNativeVisibility(visible);
		_nativeVisibility = visible;
		cast(domElement.nativeElement).setVisible(visible);
	}
}