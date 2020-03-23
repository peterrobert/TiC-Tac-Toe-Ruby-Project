# !/usr/bin/env ruby
# rubocop: disable Layout/LineLength

def print_game_board(game_board)
  i = 0
  while i < 3
    print (game_board[i].to_s + ' ' + ' | ')
    i += 1
  end
   puts "\n"
  i = 3
  while i < 6
    print (game_board[i].to_s + ' ' + ' | ')
    i += 1
  end
  puts "\n"
  i = 6
  while i < 9
    print (game_board[i].to_s + ' ' + ' | ')
    i += 1
  end
end

def move(game_board, player, movement)
  game_board.push(movement)
  player.push(movement)
end

def game_finished?(game_board)
  return false unless game_board.length == 9
  true
end

# Game starts
puts 'Welcome to Tic-Tac-Toe Project!. Created by Peter and Sergio.'
puts 'Do you want to start the game? (y/n)'

answer = ''
while answer != 'y' && answer != 'n'
  answer = gets.chomp
  puts 'Please, reply with y=YES / n=NO: ' if answer != 'y' && answer != 'n'
end

if answer == 'y'
  first_player = ''
  puts 'What is the first player\'s name: '
  while first_player.to_s.strip.empty?
    first_player = gets.chomp
    puts 'You must type a valid name. What is the first player\'s name: ' if first_player.to_s.strip.empty?
  end

  second_player = ''
  puts 'What is the second player\'s name: '
  while second_player.to_s.strip.empty?
    second_player = gets.chomp
    puts 'You must type a valid name. What is the second player\'s name: ' if second_player.to_s.strip.empty?
  end

  puts "Hello #{first_player} and #{second_player}, let\'s play..."
  
  loop do
    game_board = []
    first_player_moves = []
    second_player_moves = []

    game_reset = ''
    print_game_board(game_board)

    i = 0
    while !game_finished?(game_board)
      puts "\n"      
      if i == 0
        puts "Your turn #{first_player}: "
        t = gets.chomp      
        move(game_board, first_player_moves, t)
        i += 1
      else
        puts "Your turn #{second_player}: "
        t = gets.chomp      
        move(game_board, second_player_moves, t)
        i -= 1
      end
    end
   
    # Game reset
    puts 'The game has ended draw. '
    puts 'Do you want to play again?(y/n)'
    while game_reset != 'y' && game_reset != 'n'
      game_reset = gets.chomp
      puts 'Please, reply with y=YES / n=NO: ' if game_reset != 'y' && game_reset != 'n'
    end
  break if game_reset == 'n'
  end
end

# rubocop: enable Layout/LineLength
