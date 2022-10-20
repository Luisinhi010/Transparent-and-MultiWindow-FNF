package; // this is a template, you will need to copy these to play state to make it work lmao

import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.MouseButton;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.Window;
import openfl.geom.Matrix;
import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.utils.Assets;

class WindowsFunctionTemplate {
	var windowDad:Window;
	var dadWin = new Sprite();
	var dadScrollWin = new Sprite();

	function create() {
		popupWindow(1280, 720, null, null, 'Testing Testing');
		super.create();
	}

	function update(elapsed:Float) {
		@:privateAccess
		var dadFrame = dad._frame;

		if (dadFrame == null || dadFrame.frame == null)
			return; // prevents crashes (i think???)

		var rect = new Rectangle(dadFrame.frame.x, dadFrame.frame.y, dadFrame.frame.width, dadFrame.frame.height);

		dadScrollWin.scrollRect = rect;
		dadScrollWin.x = (((dadFrame.offset.x) - (dad.offset.x / 2)) * dadScrollWin.scaleX);
		dadScrollWin.y = (((dadFrame.offset.y) - (dad.offset.y / 2)) * dadScrollWin.scaleY);
	}

	function popupWindow(customWidth:Int, customHeight:Int, ?customX:Int, ?customY:Int, ?customName:String) {
		var display = Application.current.window.display.currentMode;
		// PlayState.defaultCamZoom = 0.5;

		if (customName == '' || customName == null)
			customName = 'Opponent.json';

		windowDad = Lib.application.createWindow({
			title: customName,
			width: customWidth,
			height: customHeight,
			borderless: false,
			alwaysOnTop: true
		});
		if (customX == null)
			customX = -10;

		windowDad.x = customX;
		windowDad.y = customY;
		if (customY == null)
			windowDad.y = Std.int(display.height / 2);

		windowDad.stage.color = 0xFF010101;
		@:privateAccess
		windowDad.stage.addEventListener("keyDown", FlxG.keys.onKeyDown);
		@:privateAccess
		windowDad.stage.addEventListener("keyUp", FlxG.keys.onKeyUp);
		// Application.current.window.x = Std.int(display.width / 2) - 640;
		// Application.current.window.y = Std.int(display.height / 2);

		// var bg = Paths.image(PUT YOUR IMAGE HERE!!!!).bitmap;
		// var spr = new Sprite();

		var m = new Matrix();

		// spr.graphics.beginBitmapFill(bg, m);
		// spr.graphics.drawRect(0, 0, bg.width, bg.height);
		// spr.graphics.endFill();
		FlxG.mouse.useSystemCursor = true;

		// Application.current.window.resize(640, 480);
		dadWin.graphics.beginBitmapFill(dad.pixels, m);
		dadWin.graphics.drawRect(0, 0, dad.pixels.width, dad.pixels.height);
		dadWin.graphics.endFill();
		dadScrollWin.scrollRect = new Rectangle();
		// windowDad.stage.addChild(spr);
		windowDad.stage.addChild(dadScrollWin);
		dadScrollWin.addChild(dadWin);
		dadScrollWin.scaleX = 0.7;
		dadScrollWin.scaleY = 0.7;
		// dadGroup.visible = false;
		// uncomment the line above if you want it to hide the dad ingame and make it visible via the windoe
		Application.current.window.focus();
		FlxG.autoPause = false;
	}
}
