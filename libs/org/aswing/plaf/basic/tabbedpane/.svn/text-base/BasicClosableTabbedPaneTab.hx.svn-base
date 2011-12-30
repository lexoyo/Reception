package org.aswing.plaf.basic.tabbedpane;


import org.aswing.Container;
	import org.aswing.JLabel;
	import org.aswing.AbstractButton;
	import org.aswing.Insets;
	import org.aswing.Component;
	import org.aswing.BorderLayout;
	import org.aswing.CenterLayout;
	import org.aswing.JButton;
	import org.aswing.ASFont;
	import org.aswing.ASColor;
	import org.aswing.Icon;
	import org.aswing.border.EmptyBorder;

/**
 * The basic imp for ClosableTab
 * @author paling
 */
class BasicClosableTabbedPaneTab implements ClosableTab{
	
	private var panel:Container;
	private var label:JLabel;
	private var button:AbstractButton;
	private var margin:Insets;
	private var owner:Component;
	private var placement:Int;
	
	public function new(){
 
	}
	
	public function initTab(owner:Component):Void{
		this.owner = owner;
		panel = new Container();
		panel.setLayout(new BorderLayout());
		label = new JLabel();
		panel.append(label, BorderLayout.CENTER);
		button = createCloseButton();
		var bc:Container = new Container();
		bc.setLayout(new CenterLayout());
		bc.append(button);
		panel.append(bc, BorderLayout.EAST);
		label.setFocusable(false);
		button.setFocusable(false);
		margin = new Insets(0,0,0,0);
	}
	
	public function setTabPlacement(tp:Int):Void{	
		placement = tp;
	}
	
	public function getTabPlacement():Int{
		return placement;
	}
	
	private function createCloseButton():AbstractButton{
		var button:AbstractButton = new JButton();
		button.setMargin(new Insets());
		button.setOpaque(false);
		button.setBackgroundDecorator(null);
		button.setIcon(new CloseIcon());
		return button;
	}
	
	public function setFont(font:ASFont):Void{
		label.setFont(font);
	}
	
	public function setForeground(color:ASColor):Void{
		label.setForeground(color);
	}
	
	public function setMargin(m:Insets):Void{
		if(!margin.equals(m)){
			panel.setBorder(new EmptyBorder(null, m));
			margin = m.clone();
		}
	}
	
	public function setEnabled(b:Bool):Void{
		label.setEnabled(b);
		button.setEnabled(b);
	}
	
	public function getCloseButton():Component{
		return button;
	}
	
	public function setVerticalAlignment(alignment:Int):Void{
		label.setVerticalAlignment(alignment);
	}
	
	public function getTabComponent():Component{
		return panel;
	}
	
	public function setHorizontalTextPosition(textPosition:Int):Void{
		label.setHorizontalTextPosition(textPosition);
	}
	
	public function setTextAndIcon(text:String, icon:Icon):Void{
		label.setText(text);
		label.setIcon(icon);
	}
	
	public function setIconTextGap(iconTextGap:Int):Void{
		label.setIconTextGap(iconTextGap);
	}
	
	public function setSelected(b:Bool):Void{
		//do nothing
	}
	
	public function setVerticalTextPosition(textPosition:Int):Void{
		label.setVerticalTextPosition(textPosition);
	}
	
	public function setHorizontalAlignment(alignment:Int):Void{
		label.setHorizontalAlignment(alignment);
	}
	
}