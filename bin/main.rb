# !/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

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
    game.reset

    puts "\n" + board.print(first_player.movements, second_player.movements) + "\n"

    player_turn = first_player
    until game.finished?(first_player.movements, second_player.movements)

      puts "\nYour turn #{player_turn.name}: "
      movement = gets.chomp

      until game.valid_movement?(first_player.movements, second_player.movements, movement)
        puts "\nPlease, insert a valid slot. Your turn #{player_turn.name}: "
        movement = gets.chomp
      end

      game.new_movement(player_turn.movements, movement.to_i)
      player_turn = game.switch_player ? second_player : first_player

      puts "\n" + board.print(first_player.movements, second_player.movements)
    end

    if game.who_won == 1
      puts "\nGame Over. The winner is #{first_player.name}."
    elsif game.who_won == 2
      puts "\nGame Over. The winner is #{second_player.name}."
    else
      puts "\nGame Over. It is a draw."
    end

    game_reset = ''
    puts "\nDo you want to play again?(y/n)"
    while game_reset != 'y' && game_reset != 'n'
      game_reset = gets.chomp
      puts "\nPlease, reply with y=YES / n=NO: " if game_reset != 'y' && game_reset != 'n'
    end

    break if game_reset == 'n'
  end
end
