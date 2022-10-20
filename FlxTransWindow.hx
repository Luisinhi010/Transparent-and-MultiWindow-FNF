package; // original git hub: https://github.com/DuskieWhy/Transparent-and-MultiWindow-FNF

@:cppFileCode('#include <windows.h>\n#include <dwmapi.h>\n\n#pragma comment(lib, "Dwmapi")')
class FlxTransWindow {
	@:functionCode('
        HWND hWnd = GetActiveWindow();
        res = SetWindowLong(hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) | WS_EX_LAYERED);
        if (res)
        {
            SetLayeredWindowAttributes(hWnd, RGB(r, g, b), 0, LWA_COLORKEY);
        }
    ')
	static public function getWindowsTransparent(res:Int = 0, r:Int, g:Int, b:Int) {
		return res;
	}

	@:functionCode('
        HWND hWnd = GetActiveWindow();
        res = SetWindowLong(hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) ^ WS_EX_LAYERED);
        if (res)
        {
            SetLayeredWindowAttributes(hWnd, RGB(r, g, b), 1, LWA_COLORKEY);
        }
    ')
	static public function getWindowsbackward(res:Int = 0, r:Int, g:Int, b:Int) {
		return res;
	}
}
