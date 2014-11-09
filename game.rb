# Player is asked what option they choose (R/P/S)
# Player chooses 1 of the 3
# Computer chooses
# Choose winner or tie 
	# Rock > Scissors
	# Scissors > Paper
	# Paper > Rock
# Ask if player wants to play again


class Player 
	attr_accessor :choice
	def initialize 
	end
	def pick
		begin
			puts "Please pick (R/P/S)"
			c = gets.chomp.downcase
		end until Game::CHOICE.keys.include?(c)
		self.choice = Game::CHOICE[c]
			puts "you picked #{choice}"
	end
end

class Computer 
	attr_accessor :choice 
	def initialize 
	end
	def pick
		self.choice = Game::CHOICE.values.sample
		puts "The computer picked #{choice}"
	end
end

class Game
	CHOICE = {'r' => "rock", "p" => "paper", "s" => "scissors"}
	attr_reader :player, :computer
	def initialize
		@player = Player.new
		@computer = Computer.new
	end
	def intro
		puts "Welcome to Rock Paper Scissors"
	end
	def retry? 
	 puts "Would you like to play again?"
	end
	def hands
		puts "You picked #{player.choice} and the computer picked #{computer.choice}."
	end 
	def compare(choice, cpu)
		if choice == cpu
			self.hands
			puts "It's a tie"
		elsif (choice == "rock" && cpu == "scissors") || (choice == "paper" && cpu == "rock") || (choice == "scissors" && cpu == "paper")
			self.hands
			puts "You won!"
		else 
			self.hands
			puts "You lost!"
		end
	end
	def play
		self.intro 
		@player.pick
		@computer.pick
		self.compare(player.choice, computer.choice)
		self.retry?
	end
end


game = Game.new.play