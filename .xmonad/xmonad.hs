import System.Posix.Env (getEnv)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Mate
import qualified Data.Map as M

main :: IO ()
main = xmonad joshConfig

joshConfig = mateConfig {
  modMask = mod4Mask
  , keys = joshKeys
}

emacsCommand = "emacsclient -nc"
chromeCommand = "chromium-browser --force-device-scale-factor=2"

joshKeys conf@(XConfig {XMonad.modMask = modMask}) = M.union jKeys mateKeys
  where
      mateKeys = keys mateConfig conf
      jKeys = M.fromList [
        ((modMask .|. shiftMask, xK_m),
          (spawn emacsCommand))
        , ((modMask .|. shiftMask, xK_g),
           (spawn chromeCommand))
        ]
