# !/usr/bin/env ruby
# rubocop: disable Layout/LineLength

def print_board(first_player_movements, second_player_movements)
  board = ""
  for i in 0..8 do
    if first_player_movements.any?(i + 1)
      (i + 1) % 3 > 0 ? board += "X | " : board += "X"
    elsif second_player_movements.any?(i + 1)
      (i + 1) % 3 > 0 ? board += "O | " : board += "O"
    else
      (i + 1) % 3 > 0 ? board += "  | " : board += " "
    end
    board += "\n—————————\n" if (i + 1) % 3 == 0 && i < 8
  end
  print board
end

def move(board, player, movement)
  if movement.is_a?(Integer)
    if movement >= 1 && movement <= 9
      board.push(movement)
      player.push(movement)
      return true
    end
  end
  false
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
    first_player_moves = []
    second_player_moves = []

    game_reset = ''
    print_board(game_board)
    puts "\n"      

    i = 0
    while !game_finished?(game_board)      
      if i == 0
        puts "Your turn #{first_player}: "
        t = gets.chomp.to_i
        while !move(game_board, first_player_moves, t)
          puts "Please, insert a valid value. Your turn #{first_player}: "
          t = gets.chomp.to_i
        end                
        i += 1
      else
        puts "Your turn #{second_player}: "
        t = gets.chomp.to_i
        while !move(game_board, second_player_moves, t)
          puts "Please, insert a valid value. Your turn #{second_player}:"
          t = gets.chomp.to_i
        end           
        i -= 1
      end
      print_board(game_board)
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
