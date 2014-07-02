{-# LANGUAGE TemplateHaskell, ForeignFunctionInterface #-}

module Graphics.Wayland.Internal.SpliceProtocol where

import Data.Functor
import Language.Haskell.TH
import Foreign.C.Types

import Graphics.Wayland.Internal.Protocol
import Graphics.Wayland.Internal.Scanner



$(runIO $ generateTypes <$> readProtocol)
$(runIO $ generateEnums <$> readProtocol)
$((runIO $ readProtocol) >>= generateClientMethods)
$((runIO $ readProtocol) >>= generateServerMethods)
