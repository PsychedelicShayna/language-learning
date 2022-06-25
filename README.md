# Haskell λ Payground 
This is my personal playground for learning Haskell, and exploring this beautiful language! This isn't an actual project, just a collection of Haskell source files covering different subjects, and areas of the language, filled with educational comments. The README also contains useful learning and exploratory resources. 

The [haskell-for-imperative-programmers](/source/haskell-for-imperative-programmers/) subdirectory contains Haskell source files that follow alongside a [40+ video course](https://www.youtube.com/watch?v=Vgu82wiiZ90&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=1) by the same name, which is how I got started with this language. 


## Useful Resources 
_This list might expand in the future_
* [**Hoogle** _(Google, but for Haskell)_](https://hoogle.haskell.org/)
* [**Haskell Standard Library** _(aka base, prelude_)](https://hackage.haskell.org/package/base)
* [**Hackage - The Haskell Package Repository**](https://hackage.haskell.org/)
* [**Haskell Online Playground** (REPL)](https://play-haskell.tomsmeding.com/play)
* [**Haskell For Imperative Programmers**](https://www.youtube.com/watch?v=Vgu82wiiZ90&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=2)
* [**Learn You a Haskell!** _(Free Book)_](http://learnyouahaskell.com/chapters)
* [**Haskell for C Programmers**](https://wiki.haskell.org/Haskell_Tutorial_for_C_Programmers)


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
