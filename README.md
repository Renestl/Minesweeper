# Minesweeper

Based on [Minesweeper](http://minesweeperonline.com/#beginner) ([wiki](https://en.wikipedia.org/wiki/Microsoft_Minesweeper))

## Learning Goals
* Be comfortable using git merge to merge a feature branch to the master branch
* Know how to create a remote repository and push to it
* Know how to use recursion to simplify complicated logic
* Know when to separate logic for different parts of your project into different classes

## Setup

```
ruby minesweeper.rb
```

## Game Play
* `*` for unexplored squares
* `_` for "interior" squares when exploring
* a one-digit number for "fringe" squares
* `F` for flagged spots
* `B` for bombs

Prefix 
`r 1,3` to reveal row 1, column 3 square
`f 1,3` to flag row 1, column 3 square
