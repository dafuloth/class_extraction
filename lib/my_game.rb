require_relative "player.rb"
require_relative "board.rb"

class Game 

	def initialize(board = Board.new, player1 = Player.new("Anne", 1), player2 = Player.new("Bill", 1))
		@player1 = player1
		@player2 = player2

		@snakes = board.snakes
		@ladders = board.ladders


		puts "#{@player1} starts at position #{@player1.position}"
		puts "#{@player2} starts at position #{@player2.position}"
		
		@player1_position = @player1.position
		@player2_position = @player2.position
	end

	def play(player, nb_of_steps)
		move(player, nb_of_steps)
		if has_finished?(player)
			puts "#{player == 'player1' ? @player1 : @player2} wins!"
		else
			puts (player == 'player1' ? "#{@player1}: #{@player1_position}" : "#{@player2}: #{@player2_position}")
		end
	end

	private

	def move(player, nb_of_steps)
		if player == 'player1'
			@player1_position += nb_of_steps

			# test for @snakes or @ladders
			if @snakes.include?(@player1_position)
				puts "#{@player1} fell on a snake :("
				@player1_position = @snakes[@player1_position]
			elsif @ladders.include?(@player1_position)
				puts "#{@player1} fell on a ladder :)"
				@player1_position = @ladders[@player1_position]
			end
		elsif player == 'player2'
			@player2_position += nb_of_steps

			# test for @snakes or @ladders
			if @snakes.include?(@player2_position)
				puts "#{@player2} fell on a snake :("
				@player2_position = @snakes[@player2_position]
			elsif @ladders.include?(@player2_position)
				puts "#{@player2} fell on a ladder :)"
				@player2_position = @ladders[@player2_position]
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

