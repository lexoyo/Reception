/*
	This file is part of Reception, which is based on Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package reception.button.abstract;

import cocktail.domElement.DOMElement;
import cocktail.domElement.DOMElementData;
import cocktail.domElement.EmbeddedDOMElement;
import cocktail.nativeElement.NativeElement;
import haxe.Log;

/**
 * This DOMElement is in charge of displaying a button
 * This is the abstract class which handles cross platform operations
 * @author lexoyo
 */
class ButtonDOMElement extends EmbeddedDOMElement
{
	//////////////////////
	// PUBLIC ATTRIBUTES
	/////////////////////
	
	/**
	 * The state of the button
	 */
	private var _enabled:Bool;
	public var enabled(getEnabled, setEnabled):Bool;

	/**
	 * The label of the button
	 */
	private var _text:String;
	public var text(getText, setText):String;

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
		super(nativeElement);
		
		// init attributes
		_enabled = true;
		_text = "Button";
	}

	//////////////////////////////////////////////////////////////////////////////////////////
	// GETTER/SETTER
	//////////////////////////////////////////////////////////////////////////////////////////
	
	private function getEnabled():Bool
	{
		return _enabled;
	}
	private function setEnabled(value:Bool):Bool
	{
		_enabled = value;
		return value;
	}
	private function getText():String
	{
		return _text;
	}
	private function setText(value:String):String
	{
		_text = value;
		return _text;
	}
}