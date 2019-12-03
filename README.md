# Unifold vim plugin

## Description:  
Unifold is a customizable plugin for input unicode charactes using their plain english names.  

## Usage:
Move caret to the end of the word. Type `<C-l>` (`^L`, `Ctrl+L`) to replace your word with corresponding unicode character.




## Installation:

### Using some package manager:
Coming soon!

### Using source code:
Install all contents of this repo to your `$HOME/.vim` (or any other path from rtp):
```
cd $HOME/.vim/    
git clone https://github.com/knisht/unifold.git    
mv unifold/*    
```  

## Customization  
You can see a `UnifoldCharacters.txt` among this repository files. It contains already prefilled bindings for some mathematical symbols and greek letters. Format of file: `[<word> <binding>\n]*`.
