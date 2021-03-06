/**
 * Widget module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.menubutton;

/**
 * Imports.
 */
import tkd.element.uielement;
import tkd.widget.menu.menu;
import tkd.widget.textwidget;

/**
 * A menu button widget displays a textual label and/or image, and displays a 
 * menu when pressed.
 *
 * Example:
 * ---
 * auto menu = new Menu()
 * 	.addEntry("Entry 1", delegate(CommandArgs args){ ... })
 * 	.addEntry("Entry 2", delegate(CommandArgs args){ ... });
 *
 * auto menuButton = new MenuButton("Text", menu)
 * 	.pack();
 * ---
 *
 * Additional_Events:
 *     Additional events that can also be bound to using the $(LINK2 ../element/uielement.html#UiElement.bind, bind) method.
 *     $(P
 *         &lt;&lt;Invoke&gt;&gt;,
 *         &lt;&lt;PrevWindow&gt;&gt;,
 *         &lt;Alt-Key&gt;,
 *         &lt;B1-Leave&gt;,
 *         &lt;Button-1&gt;,
 *         &lt;ButtonRelease-1&gt;,
 *         &lt;Enter&gt;,
 *         &lt;Key-F10&gt;,
 *         &lt;Key-Tab&gt;,
 *         &lt;Key-space&gt;,
 *         &lt;Leave&gt;,
 *     )
 *
 * Styles:
 *     Menu button widgets support the Toolbutton style in all standard 
 *     themes, which is useful for creating widgets for toolbars.
 *
 * See_Also:
 *     $(LINK2 ./textwidget.html, tkd.widget.textwidget)
 */
class MenuButton : TextWidget
{
	/**
	 * Construct the widget.
	 *
	 * Params:
	 *     parent = The parent of this widget.
	 *     text = The text of the label.
	 *     menu = The menu that is invoked when this button is pressed.
	 *     direction = Determines where the menu appears in relation to the button.
	 *
	 * See_Also:
	 *     $(LINK2 ../element/uielement.html, tkd.element.uielement) $(BR)
	 *     $(LINK2 ./menubutton.html#MenuButtonDirection, tkd.widget.menubutton.MenuButtonDirection) $(BR)
	 */
	this(UiElement parent, string text, Menu menu, string direction = MenuButtonDirection.below)
	{
		super(parent);
		this._elementId = "menubutton";

		this._tk.eval("ttk::menubutton %s -textvariable %s -menu %s -direction %s", this.id, this._textVariable, menu.id, direction);

		this.setText(text);
	}

	/**
	 * Construct the widget.
	 *
	 * Params:
	 *     text = The text of the label.
	 *     menu = The menu that is invoked when this button is pressed.
	 *     direction = Determines where the menu appears in relation to the button.
	 *
	 * See_Also:
	 *     $(LINK2 ./menubutton.html#MenuButtonDirection, tkd.widget.menubutton.MenuButtonDirection) $(BR)
	 */
	this(string text, Menu menu, string direction = MenuButtonDirection.below)
	{
		this(null, text, menu, direction);
	}
}

/**
 * Placement of a menu relative to a menu button.
 */
enum MenuButtonDirection : string
{
	above = "above", /// Above the menu button.
	below = "below", /// Below the menu button.
	flush = "flush", /// Directly over the menu button.
	left  = "left",  /// Left of the menu button.
	right = "right", /// Right of the menu button.
}
