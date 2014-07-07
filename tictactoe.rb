class Tictactoe
    attr_reader :players, :board 
    attr_accessor :first_players_turn

	def initialize
		@board = Board.new
		@players = [Player.new('X', Player.new('O')]
		@first_players_turn = true 	
	end

	def play
		puts "Welcome to the game"
		board.print
		while move_left? do 
			puts "#{player_live.name}, it's your turn."
			puts "Enter an index:"
			input_index = gets.chomp.to_i
			move = Move.new(player_live, board, input_index)
			if  move.execute    #move works
				board.print     #print board
				self.first_players_turn = !first_players_turn     #make it other person's turn 
			else
				puts "Error: that space is taken "
				
			end
			#gameplay loop 
		end 
		#end game 	
	end

	def player_live
	    first_players_turn ? player.first : player.last    # if and else

	end

	def move_left?
		board.state.any? {|space| space.nil? }		
	end

end


class Player
	attr_reader :symbol

	def initialize(symbol)
		@symbol = symbol
	end

	def move
		#TODO	
	end

	def name
		"Player #{symbol}"
	end

end

class Board
	attr_accessor :state
	def initialize
		@state = Array.new(9)	
	end

	def space_available?(index)
	state[index].nil?	
	end

	def take_space(symbol, index)
		if space_available?(index)
			state[index] = symbol
			return true
		else
			return false
		end	
	end

	def print
		puts state[0,3].join (' | ')
		puts "--------"
		puts state[3,3].join (' | ')
		puts "--------"
		puts state[6,3].join (' | ')
		puts "--------"
	end
end 

class Move
	attr_reader :player , :board, :index
	def initialize(player, board, index)
		@player = player
	    @board = board 
    	@index = index 	
	end

	def execute
		board.take_space(player.symbol, index)

	end

end	


Tictactoe.new.start
















