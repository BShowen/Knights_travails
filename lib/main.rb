require "bundler/inline"
gemfile do 
    source 'https://rubygems.org'
    gem 'colorize'
end
require "./knight.rb"

board = Board.new
knight = Knight.new

knight.current_position = [0,0]
knight.desired_position = [0,7]
knight.knight_moves(knight.current_position,knight.desired_position)
knight.visited_coordinates.each do |coordinate|
    board.square(coordinate).character = "*"
    puts `clear`
    puts board
    sleep 0.2
end
knight.final_coordinates.each_with_index do |coordinate, index|
    board.square(coordinate).character = index.to_s
    board.square(coordinate).color = :blue
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