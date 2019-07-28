class GamePiece

    # Find the shortest possible path between two points. 
    def knight_moves(current_pos, desired_pos)
        MyQueue::enqueue(current_pos)
        loop do
            dequeue_coordinate_to_visited
            check_if_desired_position_found
            # if final_coordinates is populated then the shortest path has been found.
            break if self.final_coordinates.empty? == false
        end
        puts "You made it in from #{self.current_position} to #{self.desired_position} in #{self.final_coordinates.length - 1} moves. Your path is:"
        self.final_coordinates.each do |coordinate|
            puts "#{coordinate}".rjust(65)
        end
    end

    # Keep track of all the verticies we visit that got us to the final vertex. 
    def dequeue_coordinate_to_visited
        dequeued_coordinate = MyQueue::dequeue
        self.visited_coordinates << dequeued_coordinate
    end

    def check_if_desired_position_found
        #array of edges (children) from current vertex
        legal_moves_from_current_position = self.legal_moves(self.visited_coordinates.last)

        if legal_moves_from_current_position.include?(self.desired_position)
            return finalize_route_from_visited_coordinates
        else
            MyQueue::check_for_doubles_then_enqueue(legal_moves_from_current_position, self.visited_coordinates)
        end
    end

    # Navigate backwards from the final vertex to the starting vertex through each verticies parent. 
    def finalize_route_from_visited_coordinates
        self.final_coordinates << self.desired_position
        until self.visited_coordinates.empty?
            last_visited_coordinate = self.visited_coordinates.pop
            legal_moves_from_current_position = self.legal_moves(last_visited_coordinate)
            if legal_moves_from_current_position.include?(self.final_coordinates.first)
                self.final_coordinates.unshift(last_visited_coordinate)
            end
        end
    end 

    # Check if there is a cycle in the final path. Use for testing in irb. 
    def check_for_cycle
        i = self.final_coordinates.length - 1
        while i > 0
            puts "------"
            for x in (0..(i - 1)) 
                puts "#{self.legal_moves(self.final_coordinates[i]).include?(self.final_coordinates[x])}"
            end
            i -= 1
        end
    end

end