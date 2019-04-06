module Paths_codejam (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/fabioyamate/Projects/codejam/codejam-haskell/.stack-work/install/x86_64-osx/lts-5.11/7.10.3/bin"
libdir     = "/Users/fabioyamate/Projects/codejam/codejam-haskell/.stack-work/install/x86_64-osx/lts-5.11/7.10.3/lib/x86_64-osx-ghc-7.10.3/codejam-0.1.0.0-1LeUvbG2eLnHynkZWHdcP7"
datadir    = "/Users/fabioyamate/Projects/codejam/codejam-haskell/.stack-work/install/x86_64-osx/lts-5.11/7.10.3/share/x86_64-osx-ghc-7.10.3/codejam-0.1.0.0"
libexecdir = "/Users/fabioyamate/Projects/codejam/codejam-haskell/.stack-work/install/x86_64-osx/lts-5.11/7.10.3/libexec"
sysconfdir = "/Users/fabioyamate/Projects/codejam/codejam-haskell/.stack-work/install/x86_64-osx/lts-5.11/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "codejam_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "codejam_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "codejam_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "codejam_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "codejam_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
