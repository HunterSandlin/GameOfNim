$stdout.sync = true
puts "Welcome to the game of Nim!\n" +
	"------------------------------------\n" +
	"This is a famous game developted by mathatician\n" +
	"You will be playing a completely fair game.\n\n\n"


puts "RULES: \n" +
	"There will be a random amount of marbles represented by an 'o'\n" +
	"You and the copmuter will take turns deciding how many marbles\n" +
	"you will take away; 3, 2, or 1. You have to take at least one.\n" +
	"The winner is whoever takes the last marble.\n\n\n"  

puts "EXAMPLE: \n" +
	"Marbles remaining: o o o o o \n" +
	"Player one taked 3 marbles.\n\n" +
	"Marbles remaining: o o \n" +
	"Player two takes 2 marbles \n\n" +
	"No marbles remaining: Player 2 wins!!\n\n\n\n"



def play
	puts "-NEW GAME-" +
		"------------------------------------\n\n"
	marbles_left = rand(6..15)
	puts turn
	#0 is copmuter's turn, 1 is player's turn
	puts turn == 0 ?  "The computer won the coin toss, it will go first": 
		"You won the coin toss, you will go first"

	while marbles_left > 1
		if turn == 0
			marbles_left = computerTurn(marbles_left)
		elsif turn == 1
			marbles_left = playerTurn(marbles_left)
		else
			restart
		end
	end

end

def playerTurn(marbles)
	puts "\nMarbles left #{" o"*marbles}\n\n"
	puts "How many would you like to take (1, 2, or 3)? "
	input_take = gets.chomp.to_i
	puts "You took #{input_take} marble(s)"
	if marbles < 1
		put "\n---No marbles remaining: You win!!---\n\n\n"
		return -1
	end
	return marbles - input_take
end


def computerTurn(marbles)
	puts "\nMarbles left #{" o"*marbles}\n\n"
	
	#marbles = % 4 == 0 ? take 
	#finish math

	take = gets.chomp.to_i
	puts "The computer took #{take} marble(s)"
	if marbles < 1
		put "\n---No marbles remaining: The computer wins---\n\n\n"
		return -1
	end
	return marbles - take
end


def restart
	#TODO: fill in restart. Ask for restart then act 
end  





playerTurn(5)