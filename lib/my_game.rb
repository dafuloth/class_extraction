require_relative "player.rb"
require_relative "board.rb"

class Game 
	Ladders = {
		2 => 15,
		5 => 7,
		9 => 27,
		18 => 29,
		25 => 35
	}

	Snakes = {
		17 => 4,
		24 => 16,
		32 => 30,
		34 => 12
	}

	def initialize
		@p1 = Player.new("Anne", 1)
		@p2 = Player.new("Bill", 1)

		puts "#{@p1} starts at position #{@p1.position}"
		puts "#{@p2} starts at position #{@p2.position}"
		
		@player1_position = @p1.position
		@player2_position = @p2.position
	end

	def play(player, nb_of_steps)
		move(player, nb_of_steps)
		if has_finished?(player)
			puts "#{player} wins!"
		else
			puts (player == 'player1' ? "player1: #{@player1_position}" : "player2: #{@player2_position}")
		end
	end

	private

	def move(player, nb_of_steps)
		if player == 'player1'
			@player1_position += nb_of_steps

			# test for snakes or ladders
			if Snakes.include?(@player1_position)
				puts "#{player} fell on a snake :("
				@player1_position = Snakes[@player1_position]
			elsif Ladders.include?(@player1_position)
				puts "#{player} fell on a ladder :)"
				@player1_position = Ladders[@player1_position]
			end
		elsif player == 'player2'
			@player2_position += nb_of_steps

			# test for snakes or ladders
			if Snakes.include?(@player2_position)
				puts "#{player} fell on a snake :("
				@player2_position = Snakes[@player2_position]
			elsif Ladders.include?(@player2_position)
				puts "#{player} fell on a ladder :)"
				@player2_position = Ladders[@player2_position]
			end
		else
			fail 'Invalid player'
		end
	end

	def has_finished?(player)
		if player == 'player1' && @player1_position >= 36
			return true
		elsif player == 'player2' && @player2_position >= 36
			return true
		else
			return false
		end
	end
end

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


# Future user stories to think about while refactoring:
#  - I want be be able to play with different boards
#  - I'd like to be able to have custom player names

