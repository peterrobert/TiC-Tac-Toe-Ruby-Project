#!/usr/bin/env ruby
def game_board
  board = ["1","2","3","4","5","6","7","8","9",]
  i = 0;
  while i < 3
    print (board[i] + " " + " | ")
    i += 1
  end
   puts "\n"
  i = 3
  while i < 6
    print (board[i] + " " + " | ")
    i += 1
  end
  puts "\n"
  i = 6
  while i < 9
    print (board[i] + " " + " | ")
    i += 1
  end
end

puts 'Welcome to Tic-Tac-Toe Project!. Created by Peter and Sergio.'
puts 'Do you want to start the game? (y/n)'

answer = ''
while answer != 'y' && answer != 'n'
  answer = gets.chomp
  puts 'Please, reply with y=YES / n=NO: '  if answer != 'y' && answer != 'n'
end    

if answer == 'y'
  player_1 = ''  
  puts 'What is the first player\'s name: '
  while player_1.to_s.strip.length < 1
    player_1 = gets.chomp
    puts 'You must type a valid name. What is the first player\'s name: ' if player_1.to_s.strip.length < 1
  end
  
  player_2 = ''
  puts 'What is the second player\'s name: '
  while player_2.to_s.strip.length < 1
    player_2 = gets.chomp
    puts 'You must type a valid name. What is the second player\'s name: ' if player_2.to_s.strip.length < 1
  end

  puts "Hello #{player_1} and #{player_2}, let\'s play..."

  game_board
end

