# !/usr/bin/env ruby
# rubocop: disable Metrics/BlockLength, Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity, Metrics/BlockNesting

require './lib/player.rb'

def print_board(first_player, second_player)
  board = ''
  (0..8).each do |i|
    board += if first_player.any?(i + 1)
               ((i + 1) % 3).positive? ? 'X | ' : 'X'
             elsif second_player.any?(i + 1)
               ((i + 1) % 3).positive? ? 'O | ' : 'O'
             else
               ((i + 1) % 3).positive? ? '  | ' : ' '
             end
    board += "\n—————————\n" if ((i + 1) % 3).zero? && i < 8
  end
  puts board
end

def valid_movement?(first_player, second_player, new_movement)
  begin
    is_integer = true if Integer(new_movement)
  rescue StandardError
    is_integer = false
  end

  if is_integer
    if new_movement.to_i >= 1 && new_movement.to_i <= 9
      return first_player.none?(new_movement) && second_player.none?(new_movement)
    end
  end
  false
end

def new_movement(player, movement)
  player.push(movement.to_i)
end

def player_win?(player_movements)
  # ONLY FOR TEST, IT IS NOT THE FINAL METHOD TO DETECT IF A PLAYER WON
  return false if player_movements.length < 4

  [true, false].sample
end

def game_finished?(first_player_movements, second_player_movements)
  return 1 if player_win?(first_player_movements)
  return 2 if player_win?(second_player_movements)

  if first_player_movements.length + second_player_movements.length == 9
    0
  else
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
  player_name = ''
  puts 'What is the first player\'s name?: '
  while player_name.to_s.strip.empty?
    player_name = gets.chomp
    puts 'You must type a valid name. What is the first player\'s name?: ' if player_name.to_s.strip.empty?
  end
  first_player = Player.new(player_name)

  player_name = ''
  puts 'What is the second player\'s name?: '
  while player_name.to_s.strip.empty?
    player_name = gets.chomp
    puts 'You must type a valid name. What is the second player\'s name?: ' if player_name.to_s.strip.empty?
  end
  second_player = Player.new(player_name)

  puts "\nHello #{first_player.name} and #{second_player.name}, let\'s play..."

  loop do
    first_player_movements = []
    second_player_movements = []

    game_reset = ''
    print_board(first_player_movements, second_player_movements)
    puts "\n"

    i = 0
    who_won = -1
    while who_won.negative?
      if i.zero?
        puts "\nYour turn #{first_player.name}: "
        movement = gets.chomp

        until valid_movement?(first_player_movements, second_player_movements, movement)
          puts "\nPlease, insert a valid value. Your turn #{first_player}: "
          movement = gets.chomp
        end
        new_movement(first_player_movements, movement)

        i += 1
      else
        puts "\nYour turn #{second_player.name}: "
        movement = gets.chomp

        until valid_movement?(first_player_movements, second_player_movements, movement)
          puts "\nPlease, insert a valid value. Your turn #{second_player}:"
          movement = gets.chomp
        end
        new_movement(second_player_movements, movement)

        i -= 1
      end
      print_board(first_player_movements, second_player_movements)
      who_won = game_finished?(first_player_movements, second_player_movements)
    end

    if who_won == 1
      puts "\nGame Over. The winner is #{first_player.name}."
    elsif who_won == 2
      puts "\nGame Over. The winner is #{second_player.name}."
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

# rubocop: enable Metrics/BlockLength, Metrics/CyclomaticComplexity
# rubocop: enable Metrics/PerceivedComplexity, Metrics/BlockNesting
