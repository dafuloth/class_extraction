# Class Extraction exercise

Refactored game.rb to extract classes. Based on a Snakes & Ladders game.

Original is game.rb containing the Game class.

## New classes

* Player (player.rb)
* Board (board.rb)

## Playing a game

```ruby

# create a game
g = Game.new

```

Game objects can be initialised with a board and players: `Game.new(Board, Player, Player)`

Otherwise, if not specified, the default board is used and default players are used, i.e.

`Game.new` implies:  
`Game.new(board = Board.new, player1 = Player.new("Anne", 1), player2 = Player.new("Bill", 1))`
