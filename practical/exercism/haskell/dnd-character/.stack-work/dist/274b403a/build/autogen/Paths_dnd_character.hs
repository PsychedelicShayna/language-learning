{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_dnd_character (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\bin"
libdir     = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\lib\\x86_64-windows-ghc-8.10.7\\dnd-character-1.1.0.1-Fl7o0IXmTIBFXaP22hvJIq"
dynlibdir  = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\share\\x86_64-windows-ghc-8.10.7\\dnd-character-1.1.0.1"
libexecdir = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\libexec\\x86_64-windows-ghc-8.10.7\\dnd-character-1.1.0.1"
sysconfdir = "C:\\Users\\Fedora\\Dropbox\\Repositories\\language-learning\\practical\\exercism\\haskell\\dnd-character\\.stack-work\\install\\b15a09c4\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dnd_character_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dnd_character_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "dnd_character_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "dnd_character_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dnd_character_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dnd_character_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
