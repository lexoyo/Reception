/*
	This file is part of Reception, which is based on Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package reception.button.as3;

import org.aswing.JButton;
import org.aswing.ASColor;

import cocktail.domElement.DOMElement;
import cocktail.domElement.DOMElementData;
import cocktail.domElement.EmbeddedDOMElement;
import cocktail.nativeElement.NativeElement;
import haxe.Log;

/**
 * This DOMElement is in charge of displaying a button
 * This is the abstract class which handles as3 specific operations
 * 
 * A good example of an ASWing button: http://svn.aswing.org/aswing/trunk/haXeAsWing/Main.hx
 *
 * @author lexoyo
 */
class ButtonDOMElement extends reception.button.abstract.ButtonDOMElement
{
	//////////////////////////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR 
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * class constructor
	 * create the button native element
	 */
	public function new(nativeElement:NativeElement = null) 
	{
		//use the provided NativeElement if any
		if (nativeElement == null)
		{
			var jb:JButton = new JButton();
			
			// init defaults
	
			jb.setBackground(new ASColor(0xEEEEEE));
			jb.setForeground(new ASColor(0x000000));
//			jb.setSizeWH(100, 20);
//			jb.setLocationXY(10, 10);
//			flash.Lib.current.addChild(jb);
			nativeElement = jb;
		}
		super(nativeElement);
	}
	/**
	 * Override to instantiate an embedded DOMElement specific 
	 * style manager
	 */
	override private function initStyle():Void
	{
		this._style = new AsWingStyle(this);
	}

	//////////////////////////////////////////////////////////////////////////////////////////
	// GETTER/SETTER
	//////////////////////////////////////////////////////////////////////////////////////////
	
	override private function setEnabled(value:Bool):Bool
	{
		value = super.setEnabled(value);
		cast(_nativeElement, JButton).setEnabled(value);
		return value;
	}
	override private function setText(value:String):String
	{
		value = super.setText(value);
		cast(_nativeElement, JButton).setText(value);
		return value;
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	// GETTER/SETTER overrides from EmbededDOMElement
	//////////////////////////////////////////////////////////////////////////////////////////

/* in AsWingStyle : 
	override private function setWidth(value:Int):Int
	{
		trace ("setWidth XXX " + value);
		super.setWidth(value);
//		cast(_nativeElement, JButton).setSizeWH(value, height);
		return value;
	}
	override private function setHeight(value:Int):Int
	{
		super.setHeight(value);
		cast(_nativeElement, JButton).setSizeWH(width, value);
		return value;
	}
/**/	
}