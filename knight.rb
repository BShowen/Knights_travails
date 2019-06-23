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

    def enqueue(coords)
        coords.each do |coordinate|
            next if (@visited_coordinates.include?(coordinate) || MyQueue::queue.include?(coordinate))
            MyQueue::enqueue(coordinate)
        end
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
            enqueue(legal_moves_from_current_position)
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

    # def enque(coordinates)
    #     legal_moves_adj(coordinates).each do |item|
    #         MyQueue::enqueue(item) unless MyQueue::queue.include?(item)
    #     end
    # end

    # def all_moves(current_pos, desired_pos, visited = [])
    #     if self.legal_moves_adj(current_pos).include?(desired_pos) 
    #         MyQueue::clear_queue
    #         visited << current_pos
    #         visited << desired_pos
    #         return visited
    #     else
    #         visited << current_pos
    #         self.enque(current_pos)
    #         all_moves(MyQueue::dequeue, desired_pos, visited)
    #     end
    # end

    # def knight_moves(current_pos, desired_pos)
    #     keep = []
    #     all_moves(current_pos, desired_pos).reverse.each_with_index do |coords, index|
    #         keep << coords if index == 0
    #         if self.legal_moves_adj(keep.last).include?(coords)
    #             keep << coords
    #         else
    #             next
    #         end
    #     end
    #     puts "You made it in #{keep.length - 1} moves. Heres your path:"
    #     keep.reverse.each do |item|
    #         puts "#{item}".rjust(30)
    #     end
    #     return
    # end
end