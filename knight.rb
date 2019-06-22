require "./adjacency_list.rb"
require "./my_queue.rb"

class Knight
    include AdjacencyList
    include MyQueue

    attr_accessor :current_pos, :desired_pos, :adjacency_list, :edge_list
    
    def initialize
        @character = nil
        @current_pos = [nil,nil]
        @desired_pos = [nil,nil]
        @adjacency_list = build_adj_list 
    end

    def enque(coordiantes)
        legal_moves_adj(coordiantes).each do |item|
            MyQueue::enqueue(item) unless MyQueue::queue.include?(item)
        end
    end

    def all_moves(current_pos, desired_pos, visited = [])
        if self.legal_moves_adj(current_pos).include?(desired_pos) 
            MyQueue::clear_queue
            visited << current_pos
            visited << desired_pos
            return visited
        else
            visited << current_pos
            self.enque(current_pos)
            all_moves(MyQueue::dequeue, desired_pos, visited)
        end
    end

    def knight_moves(current_pos, desired_pos)
        keep = []
        all_moves(current_pos, desired_pos).reverse.each_with_index do |coords, index|
            keep << coords if index == 0
            if self.legal_moves_adj(keep.last).include?(coords)
                keep << coords
            else
                next
            end
        end
        puts "You made it in #{keep.length - 1} moves. Heres your path:"
        keep.reverse.each do |item|
            puts "#{item}".rjust(30)
        end
        return
    end
end