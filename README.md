# Haskell λ Payground 
This is my personal playground for learning Haskell, and exploring this beautiful language! This isn't an actual project, just a collection of Haskell source files covering different subjects, and areas of the language, filled with educational comments. The README also contains useful learning and exploratory resources. 

The [haskell-for-imperative-programmers](/source/haskell-for-imperative-programmers/) subdirectory contains Haskell source files that follow alongside a [40+ video course](https://www.youtube.com/watch?v=Vgu82wiiZ90&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=1) by the same name, which is how I got started with this language. 


## Useful Resources 
#### Haskell Library References & Other Resources
* [**Hoogle** _(Google, but for Haskell)_](https://hoogle.haskell.org/)
* [**Haskell Base Libraries**](https://hackage.haskell.org/package/base)
* [**Typeclassopedia**](https://wiki.haskell.org/Typeclassopedia)
* [**Hackage - The Haskell Package Repository**](https://hackage.haskell.org/)
* [**Haskell Online Playground** (REPL)](https://play-haskell.tomsmeding.com/play)

#### Books & Written Guides
* [**Learn You a Haskell!** _(Free Book)_](https://learnyouahaskell.github.io/)
* [**Haskell for C Programmers**](https://wiki.haskell.org/Haskell_Tutorial_for_C_Programmers)
* [**Functors And Monads For People Who Have Read Too Many "Tutorials"**](http://www.jerf.org/iri/post/2958)
* [**Category Theory for Programmers** _(Not necessary, but insightful)_](https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/)

#### Videos & Playlists
* [**Haskell For Imperative Programmers**](https://www.youtube.com/watch?v=Vgu82wiiZ90&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV)
* [**Functional Programming in Haskell**](https://www.youtube.com/watch?v=a0fPHkzK36I&list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3)
* [**Advanced Functional Programming in Haskell**](https://www.youtube.com/watch?v=-qhbNGghVfc&list=PLF1Z-APd9zK5uFc8FKr_di9bfsYv8-lbc)
* [**Category Theory** _(Not necessary, but insightful)_](https://www.youtube.com/watch?v=I8LbkfSSR58&list=PLbgaMIhjbmEnaH_LTkxLI7FMa2HsnawM_)

## Installing Haskell (Windows)
This PowerShell script almost takes all the fun out of it. It installs GHC, GHCi, GHCup, Cabal, and everything else you could possibly need to work with Haskell, sourced from the [GHCup website](https://www.haskell.org/ghcup/install/)
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true
```
## VS Code Extensions
* [**Haskell (Language Support)**](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)
* [**Haskell Syntax Highlighting**](https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell)
* [**Integrated Haskell Shell**](https://marketplace.visualstudio.com/items?itemName=eriksik2.vscode-ghci)
* [**Haskell Interactive**](https://marketplace.visualstudio.com/items?itemName=rutger-de-jong.haskell-interactive)
