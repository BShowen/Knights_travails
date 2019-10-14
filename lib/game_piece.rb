require_relative "board"
class GamePiece < Board

    # Find the shortest possible path between two points. 
    def knight_moves(current_pos, desired_pos)
        MyQueue::enqueue(current_pos)
        loop do
            dequeue_coordinate_to_visited
            check_if_desired_position_found
            # if final_coordinates is populated then the shortest path has been found.
            break if @final_coordinates.empty? == false
        end
    end

    # Keep track of all the verticies we visit that got us to the final vertex. 
    def dequeue_coordinate_to_visited
        dequeued_coordinate = MyQueue::dequeue
        @visited_coordinates << dequeued_coordinate
    end

    def check_if_desired_position_found
        #array of edges (children) from current vertex
        legal_moves_from_current_position = self.legal_moves(@visited_coordinates.last)
        if legal_moves_from_current_position.include?(@desired_position)
            return finalize_route_from_visited_coordinates
        else
            MyQueue::check_for_doubles_then_enqueue(legal_moves_from_current_position, @visited_coordinates)
        end
    end

    # Navigate backwards from the final vertex to the starting vertex through each verticies parent. 
    def finalize_route_from_visited_coordinates
        @final_coordinates << @desired_position
        for i in (@visited_coordinates.length - 1).downto(0) do
            last_visited_coordinate = @visited_coordinates[i]
            legal_moves_from_current_position = self.legal_moves(last_visited_coordinate)
            if legal_moves_from_current_position.include?(@final_coordinates.first)
                @final_coordinates.unshift(last_visited_coordinate)
            end
        end
    end 

    # Check if there is a cycle in the final path. Use for testing in irb. 
    def check_for_cycle
        i = @final_coordinates.length - 1
        while i > 0
            puts "------"
            for x in (0..(i - 1)) 
                puts "#{self.legal_moves(@final_coordinates[i]).include?(@final_coordinates[x])}"
            end
            i -= 1
        end
    end
end