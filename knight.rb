require "./adjacency_list.rb"
require "./my_queue.rb"
require "./game_piece.rb"

class Knight < GamePiece
    include AdjacencyList
    include MyQueue

    attr_accessor :current_position, :desired_position 
    attr_reader :final_coordinates, :visited_coordinates
    
    def initialize
        @character = nil
        @current_position = [nil,nil]
        @desired_position = [nil,nil]
        @adjacency_list = build_adj_list 
        @visited_coordinates = []
        @final_coordinates = []
    end
    #Reset the class so I can keep testing in IRB without reloading irb or having to manually clear variables 
    def clear
        initialize
        MyQueue::queue.clear
    end

end