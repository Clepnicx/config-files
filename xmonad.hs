import XMonad
import System.IO
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.Cursor

-- Xmonad Main
main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad . ewmh . docks $ defaultConfig {
        terminal           = myTerminal,
        modMask            = myModKey, 
        borderWidth        = myBorderWidth, 
        normalBorderColor  = myNormalBorderColor, 
        focusedBorderColor = myFocusedBorderColor,  
        focusFollowsMouse  = myFocusFollowsMouse, 
        workspaces         = myWorkSpaces, 

        -- hooks, layouts
        startupHook        = myStartupHook, 
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook,  
        logHook            = myLogHook xmproc 
    } `additionalKeys` myKeys



myTerminal           = "kitty"
myBrowser            = "firefox"
myFileBrowser        = "dolphin"
myModKey             = mod4Mask    -- set Win-Key as ModKey
myFocusFollowsMouse  = True
myBorderWidth        = 3
myNormalBorderColor  = "#073dc1"
myFocusedBorderColor = "#ffffff"

-- Workspaces
myWorkSpaces  = ["1: \61728", "2: \57351", "3: \61564", "4", "5", "6", "7", "8", "9:misc"] 

-- Hooks, Layouts
myStartupHook = do
    spawn "picom -b"
    spawn "feh --bg-fill --no-fehbg ~/Pictures/Wallpaper/wallpaper.png"
    setDefaultCursor xC_left_ptr

myLayoutHook  = avoidStruts  $  spacing 3 $ Tall 1 (3/100) (1/2)

myLogHook b   = dynamicLogWithPP $ xmobarPP { 
    ppWsSep = " | ", 
    ppLayout = \xs -> [],    --  hide layout name format
    ppVisible = wrap "(" ")", 
    ppCurrent = wrap "<fc=#ee9a00>" "</fc>", 
    ppTitleSanitize = \xs -> xs, 
    ppOutput = hPutStrLn b
}

myManageHook :: ManageHook
myManageHook = composeAll [
    className =? "kitty"   --> doShift "1: \61728", 
    className =? "firefox" --> doShift "2: \57351", 
    className =? "dolphin" --> doShift "3: \61564"
    ]

-- Key bindings
myKeys :: [((ButtonMask, KeySym), X ())]
myKeys = [
    ((mod4Mask, xK_w), spawn myBrowser), 
    ((mod4Mask, xK_d), spawn "rofi -show-icons -show drun -font 'hack 12' -theme /usr/share/rofi/themes/lb.rasi"), 
    ((mod4Mask, xK_n), spawn myFileBrowser)
    ]
