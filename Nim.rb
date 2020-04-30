$stdout.sync = true
$turn = 0
$playing = true
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
	"No marbles remaining: Player 2 wins!!\n\n\n"
#game started with 0 marbles once, how??
def play
	puts "Press 'Enter' or 'Return' to continue.."
	gets
	puts "\n\n\n\n"
	puts "-NEW GAME-"
		"------------------------------------\n\n"
	marbles_left = rand(6..15)
	#0 is copmuter's turn, 1 is player's turn
	puts $turn == 0 ?  "The computer won the coin toss, it will go first": 
		"You won the coin toss, you will go first"
	$turn = rand(0..1)
	while $playing == true
		if $turn == 0
			marbles_left = computerTurn(marbles_left)
		elsif $turn == 1
			marbles_left = playerTurn(marbles_left)
		else 
			puts "\n\n\n##############################"
				"Something went horribly wrong!" +
				"The game has ended. You probably" +
				"would have won anyway."
			restart()
		end
		if marbles_left <= 0
			puts "\n---No marbles remaining:---\n\n\n"
			puts $turn == 1 ?  "\tThe computer won.": "\tYou won!!"
			restart()
		end
	end

end
#TODO: add time to slow down the output and try/catch the input
def playerTurn(marbles)
	puts "\nMarbles left (#{marbles}) #{" o"*marbles}\n\n"
	puts "How many would you like to take (1, 2, or 3)? "
	input_take = gets.chomp.to_i
	puts "You took #{input_take} marble(s)\n\n"
	$turn = 0
	return marbles - input_take
end
#TODO: add time to slow down the out put
def computerTurn(marbles)
	puts "\nMarbles left (#{marbles}) #{" o"*marbles}\n\n"
	if marbles % 4 == 0
		take = 1
	else 
		take = marbles % 4
	end 
	puts "The computer took #{take} marble(s)\n\n"
	$turn = 1
	return marbles - take
end


def restart
	puts "\n\n\n\n\n\n------------------------------------\n" + 
	"Would you like to play agian? (yes/no)" 
	restart_input = gets.chomp.downcase
	if restart_input == "yes" or restart_input == "y"
		play()
	elsif restart_input == "no" or restart_input == "n"
		puts "Thanks for playing!" +
		"------------------------------------\n"
		$playing = false
	end
end  




#make a main method? Is that a thing in ruby?
play()
