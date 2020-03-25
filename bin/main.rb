# !/usr/bin/env ruby
# rubocop: disable Metrics/BlockLength
# rubocop: disable Metrics/BlockNesting
require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'

puts 'Welcome to Tic-Tac-Toe Project!. Created by Peter and Sergio.'
puts 'Do you want to start the game? (y/n)'

start_game = ''
while start_game != 'y' && start_game != 'n'
  start_game = gets.chomp
  puts 'Please, reply with y=YES / n=NO: ' if start_game != 'y' && start_game != 'n'
end

if start_game == 'y'
  game = Game.new

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

  board = Board.new
  loop do
    first_player.movements = []
    second_player.movements = []
    game_reset = ''

    board.print(first_player.movements, second_player.movements)
    puts "\n"

    i = 0
    who_won = -1
    while who_won.negative?
      if i.zero?
        puts "\nYour turn #{first_player.name}: "
        movement = gets.chomp

        until game.valid_movement?(first_player.movements, second_player.movements, movement)
          puts "\nPlease, insert a valid value. Your turn #{first_player.name}: "
          movement = gets.chomp
        end
        game.new_movement(first_player.movements, movement)

        i += 1
      else
        puts "\nYour turn #{second_player.name}: "
        movement = gets.chomp

        until game.valid_movement?(first_player.movements, second_player.movements, movement)
          puts "\nPlease, insert a valid value. Your turn #{second_player.name}:"
          movement = gets.chomp
        end
        game.new_movement(second_player.movements, movement)

        i -= 1
      end
      board.print(first_player.movements, second_player.movements)
      who_won = game.finished?(first_player.movements, second_player.movements)
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

# rubocop: enable Metrics/BlockLength
# rubocop: enable Metrics/BlockNesting
