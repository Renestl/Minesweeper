# Minesweeper

A Ruby-based, command line version of the Minesweeper game.

Based on [Minesweeper](http://minesweeperonline.com/#beginner) ([wiki](https://en.wikipedia.org/wiki/Microsoft_Minesweeper))

## Learning Goals

- Be comfortable using git merge to merge a feature branch to the master branch
- Know how to create a remote repository and push to it
- Know how to use recursion to simplify complicated logic
- Know when to separate logic for different parts of your project into different classes

## Setup

To load new game:

```
ruby minesweeper.rb
```

To load saved game:

```
ruby minesweeper.rb filename.txt
```

## Game Play

- `*` for unexplored squares
- `_` for "interior" squares when exploring
- a one-digit number for "fringe" squares
- `R` to reveal tile
- `F` for flagged spots
- `B` for bombs

Prefix

- `R,1,3` to reveal row 1, column 3 square
- `F,1,3` to flag row 1, column 3 square
- `S` to save game
  - When prompted, enter name of file to save game to
  - e.g. 'minesweeper15.txt'
