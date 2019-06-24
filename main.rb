require "./knight.rb"

knight = Knight.new
knight.current_position = [0,0]
knight.desired_position = [3,3]
knight.knight_moves(knight.current_position,knight.desired_position)
knight.clear

knight.current_position = [2,5]
knight.desired_position = [6,3]
knight.knight_moves(knight.current_position,knight.desired_position)
knight.clear

knight.current_position = [0,1]
knight.desired_position = [7,7]
knight.knight_moves(knight.current_position,knight.desired_position)
knight.clear

knight.current_position = [3,2]
knight.desired_position = [2,4]
knight.knight_moves(knight.current_position,knight.desired_position)
knight.clear