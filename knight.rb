require "./adjacency_list.rb"
require "./my_queue.rb"

class Knight
    include AdjacencyList
    include MyQueue

    attr_accessor :current_position, :desired_position, :adjacency_list, :edge_list, :visited_coordinates, :final_coordinates
    
    def initialize
        @character = nil
        @current_position = [nil,nil]
        @desired_position = [nil,nil]
        @adjacency_list = build_adj_list 
        @visited_coordinates = []
        @final_coordinates = []
    end

    def clear
        initialize
        MyQueue::queue.clear
    end

    def dequeue_coordinate_to_visited
        dequeued_coordinate = MyQueue::dequeue
        @visited_coordinates.unshift(dequeued_coordinate)
    end

    def check_if_desired_position_found
        legal_moves_from_current_position = self.legal_moves_adj(@visited_coordinates.first)
        if legal_moves_from_current_position.include?(@desired_position)
            return final_route_from_visited_coordinates
        else
            MyQueue::check_for_doubles_then_enqueue(legal_moves_from_current_position, @visited_coordinates)
        end
    end

    def final_route_from_visited_coordinates
        @final_coordinates = [@desired_position]
        until @visited_coordinates.empty?
            last_visited_coordinate = @visited_coordinates.shift
            legal_moves_from_current_position = self.legal_moves_adj(last_visited_coordinate)
            if legal_moves_from_current_position.include?(@final_coordinates.first)
                @final_coordinates.unshift(last_visited_coordinate)
            end
        end
    end 

    def check_for_cycle
        i = @final_coordinates.length - 1
        while i > 0
            puts "------"
            for x in (0..(i - 1)) 
                puts "#{self.legal_moves_adj(@final_coordinates[i]).include?(@final_coordinates[x])}"
            end
            i -= 1
        end
    end

    def knight_moves(current_pos = @current_position, desired_pos = @desired_position)
        MyQueue::enqueue(current_pos)
        loop do
            dequeue_coordinate_to_visited
            check_if_desired_position_found
            break if @final_coordinates.empty? == false
        end
        @final_coordinates
    end

end