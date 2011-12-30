package;

//import cocktail.domElement.GraphicDOMElement;
import reception.button.ButtonDOMElement;
import cocktail.domElement.ContainerDOMElement;
import cocktail.domElement.ImageDOMElement;
import cocktail.nativeElement.NativeElementData;
import cocktail.nativeElement.NativeElementManager;
import cocktail.style.StyleData;
import cocktail.unit.UnitData;


/**/
#if flash9
import org.aswing.JFrame;
import org.aswing.AsWingManager;
import org.aswing.JButton;
#end
/**/
/**
 * 
 */
class Main 
{

    static function main():Void
    {
    	trace("start");
#if flash9
    	// put this, otherwise no labels
    	AsWingManager.initAsStandard( flash.Lib.current);
#end
    	  
		//attach the main container to the document body
		var rootDOMElement:ContainerDOMElement = new ContainerDOMElement(NativeElementManager.getRoot());
		
		//////////////////////////////////////////////////////////////////////
		// 1st button
		//////////////////////////////////////////////////////////////////////
		// create a button
		var button:ButtonDOMElement = new ButtonDOMElement();
//		button.x = 400;
//		button.y = 30;
//BUG	button.style.width = DimensionStyleValue.length(px(100));

		button.text = "Cocktail Button";
		button.width = 150;
		button.height = 50;
		button.x = button.y = 100;
		button.style.position = PositionStyleValue.absolute;
//BUG		button.rotation = 100;
//BUG		button.alpha = 10;
//BUG		button.isVisible = false;

		rootDOMElement.addChild(button);


		//////////////////////////////////////////////////////////////////////
		// 2nd button
		//////////////////////////////////////////////////////////////////////
		var button2:ButtonDOMElement = new ButtonDOMElement();
		button2.text = "Click me...";
		button2.width = 100;
		button2.height = 20;
		button2.x = button2.y = 0;
		button2.style.position = PositionStyleValue.absolute;
		button2.onMouseUp = function (m){
			//trace("Disable me"); 
			button.enabled = !button.enabled; 
/*			haxe.Timer.delay(function(){
				//trace("Enable me"); 
				button.enabled = true;
			}, 4000);
*/		};
		button2.onMouseDown = function (m){
			button.x += 20;
		};
		button2.onMouseOver = function (m){button.y += 20;};
		button2.onMouseOut = function (m){button.y -= 20;};

		rootDOMElement.addChild(button2);
    }
}
