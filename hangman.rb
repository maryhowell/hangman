require "pry"
word = [ ]
board = [ ]
guesses = 6
prevguess = [ ]
done = false
check = false

word = [
  "jockey",
  "quacky",
  "nozzle",
  "pizzas",
  "snazzy"
]
#Game starts here
loop do
  puts " Welcome to Hangman"
  randomword = word[rand(0 .. word.length - 1)]
  puts "your word is #{randomword}" #need to comment out when finished
  #so you can't see the word choice
  #splitting word into array as well as putting underscore for each letter
  randomword = randomword.split ("")
  board = ["_"] * randomword.length

  until done || guesses == 0
    puts "Hangman: " + board * " "
    puts "Letters Used: " + prevguess * " "
    puts "You have #{guesses} remaining"
    #choosing a letter and pushing letter choosen to the prevguess array
    puts "Choose a letter"
    input = gets.chomp
    until check
      if ("a" .. "z").include?(input)
        check = true
      elsif input.length > 1
        puts "please try another single letter"
        input = gets.chomp
      else puts "please try another single letter"
        input = gets.chomp
      end
    end

    prevguess.push(input)
    # checks if letter is part of word and updates as well as if letter is wrong subtracts guess
    i = 0
    randomword.each do |s|
      if s == input
        board[i] = input
      end
      i += 1
    end
    if board.include? input
      guesses
    else
      guesses -= 1
    end
  end

  if board == word
    puts "YAY you won!!"
  elsif guesses == 0
    puts "You lost, Maybe next time"
    puts "The word was #{randomword.join}"
  end

  puts "Would you like to play again y or n?"
  again = gets.chomp
  if again == "n"
    break
  end
  done = false
  guesses = 6
  prevguess = [ ]
end
# binding.pry
