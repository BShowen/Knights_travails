require "bundler/inline"
gemfile do 
    source 'https://rubygems.org'
    gem 'colorize'
end
require "./knight.rb"

board = Board.new
knight = Knight.new

# knight.current_position = [0,0]
puts board
puts "Enter a starting cordinate. For example, enter 00 for (0,0): "
starting_coord = gets.chomp.split("").map(&:to_i)
knight.current_position = starting_coord
puts "Enter an ending coordinate. For example, enter 77 for (7,7): "
ending_coord = gets.chomp.split("").map(&:to_i)
knight.desired_position = ending_coord
knight.knight_moves(knight.current_position,knight.desired_position)
knight.visited_coordinates.each do |coordinate|
    # board.square(coordinate).character = "*"
    # puts `clear`
    # puts board
    # puts "press enter for next move"
    # gets.chomp
    # sleep 0.2
end
knight.final_coordinates.each_with_index do |coordinate, index|
    board.square(coordinate).character = index.to_s
    board.square(coordinate).color = :blue
    sleep 0.5
    puts `clear`
    puts board
end
puts `clear`
puts board
knight.clear

# knight.current_position = [2,5]
# knight.desired_position = [6,3]
# knight.knight_moves(knight.current_position,knight.desired_position)
# knight.clear

# knight.current_position = [0,1]
# knight.desired_position = [7,7]
# knight.knight_moves(knight.current_position,knight.desired_position)
# knight.clear

# knight.current_position = [3,2]
# knight.desired_position = [2,4]
# knight.knight_moves(knight.current_position,knight.desired_position)
# knight.clear