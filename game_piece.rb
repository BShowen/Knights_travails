class GamePiece

    def dequeue_coordinate_to_visited
        dequeued_coordinate = MyQueue::dequeue
        self.visited_coordinates.unshift(dequeued_coordinate)
    end

    def check_if_desired_position_found
        legal_moves_from_current_position = self.legal_moves_adj(self.visited_coordinates.first)
        if legal_moves_from_current_position.include?(self.desired_position)
            return final_route_from_visited_coordinates
        else
            MyQueue::check_for_doubles_then_enqueue(legal_moves_from_current_position, self.visited_coordinates)
        end
    end

    def final_route_from_visited_coordinates
        self.final_coordinates << self.desired_position
        until self.visited_coordinates.empty?
            last_visited_coordinate = self.visited_coordinates.shift
            legal_moves_from_current_position = self.legal_moves_adj(last_visited_coordinate)
            if legal_moves_from_current_position.include?(self.final_coordinates.first)
                self.final_coordinates.unshift(last_visited_coordinate)
            end
        end
    end 

    def check_for_cycle
        i = self.final_coordinates.length - 1
        while i > 0
            puts "------"
            for x in (0..(i - 1)) 
                puts "#{self.legal_moves_adj(self.final_coordinates[i]).include?(self.final_coordinates[x])}"
            end
            i -= 1
        end
    end

    def knight_moves(current_pos = self.current_position, desired_pos = self.desired_position)
        MyQueue::enqueue(current_pos)
        loop do
            dequeue_coordinate_to_visited
            check_if_desired_position_found
            break if self.final_coordinates.empty? == false
        end
        self.final_coordinates
    end
end