# Class Extraction exercise

Refactored game.rb to extract classes.  

Original is game.rb containing the Game class.

## New classes

* Player (player.rb)
* Board (board.rb)

## Playing a game

```ruby

# feature test
g = Game.new
g.play('player1', 4)
g.play('player2', 6)
g.play('player1', 2)
g.play('player2', 1)
g.play('player1', 4)
g.play('player2', 6)
g.play('player1', 3)
g.play('player2', 5)
g.play('player1', 4)
g.play('player2', 6)
g.play('player1', 2)
g.play('player2', 1)


```