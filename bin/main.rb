# !/usr/bin/env ruby
# rubocop: disable Layout/LineLength

def print_board(first_player, second_player)
  board = ""
  for i in 0..8 do
    if first_player.any?(i + 1)
      (i + 1) % 3 > 0 ? board += "X | " : board += "X"
    elsif second_player.any?(i + 1)
      (i + 1) % 3 > 0 ? board += "O | " : board += "O"
    else
      (i + 1) % 3 > 0 ? board += "  | " : board += " "
    end
    board += "\n—————————\n" if (i + 1) % 3 == 0 && i < 8
  end
  puts board
end

def is_valid_movement(first_player_movements, second_player_movements, new_movement)
  is_integer = true if Integer(new_movement) rescue false
  if is_integer
    if new_movement.to_i >= 1 && new_movement.to_i <= 9      
      return first_player_movements.none?(new_movement) && second_player_movements.none?(new_movement)
    end
  end
  false  
end 

def new_movement(player, movement)  
  player.push(movement.to_i)
end

def player_win?(player_movements)
  # ONLY FOR TEST, IT IS NOT THE FINAL METHOD TO DETECT IF A PLAYER WIN  
  return false if player_movements.length < 4

  [true, false].sample
end

def game_finished?(first_player_movements, second_player_movements)
  if first_player_movements.length + second_player_movements.length == 9
    return 1 if player_win?(first_player_movements)  
    return 2 if player_win?(second_player_movements)
    0 
  else
    return 1 if player_win?(first_player_movements)  
    return 2 if player_win?(second_player_movements)
    -1
  end
end

# Game starts
puts 'Welcome to Tic-Tac-Toe Project!. Created by Peter and Sergio.'
puts 'Do you want to start the game? (y/n)'

start_game = ''
while start_game != 'y' && start_game != 'n'
  start_game = gets.chomp
  puts 'Please, reply with y=YES / n=NO: ' if start_game != 'y' && start_game != 'n'
end

if start_game == 'y'
  first_player = ''
  puts 'What is the first player\'s name?: '
  while first_player.to_s.strip.empty?
    first_player = gets.chomp
    puts 'You must type a valid name. What is the first player\'s name?: ' if first_player.to_s.strip.empty?
  end

  second_player = ''
  puts 'What is the second player\'s name?: '
  while second_player.to_s.strip.empty?
    second_player = gets.chomp
    puts 'You must type a valid name. What is the second player\'s name?: ' if second_player.to_s.strip.empty?
  end

  puts "\nHello #{first_player} and #{second_player}, let\'s play..."
  
  loop do    
    first_player_movements = []
    second_player_movements = []

    game_reset = ''
    print_board(first_player_movements, second_player_movements)
    puts "\n"      

    i = 0
    who_won = -1
    while who_won < 0
      if i == 0
        puts "\nYour turn #{first_player}: "
        t = gets.chomp
        
        while !is_valid_movement(first_player_movements, second_player_movements, t)          
          puts "\nPlease, insert a valid value. Your turn #{first_player}: "
          t = gets.chomp
        end                
        new_movement(first_player_movements, t)
        
        i += 1
      else
        puts "\nYour turn #{second_player}: "
        t = gets.chomp

        while !is_valid_movement(first_player_movements, second_player_movements, t)          
          puts "\nPlease, insert a valid value. Your turn #{second_player}:"
          t = gets.chomp
        end           
        new_movement(second_player_movements, t)

        i -= 1
      end
      print_board(first_player_movements, second_player_movements)
      who_won = game_finished?(first_player_movements, second_player_movements)
    end
   
    if who_won == 1
      puts "\nGame Over. The winner is #{first_player}."      
    elsif who_won == 2
      puts "\nGame Over. The winner is #{second_player}."
    else
      puts "\nGame Over. It is a draw."
    end

    puts "\nDo you want to play again?(y/n)"
    while game_reset != 'y' && game_reset != 'n'
      game_reset = gets.chomp
      puts "\nPlease, reply with y=YES / n=NO: " if game_reset != 'y' && game_reset != 'n'
    end
  break if game_reset == 'n'
  end
end

=begin
def is_number?(x)
  true if Integer(x) rescue false
end

a = Integer("123")
p a
=end
# rubocop: enable Layout/LineLength
