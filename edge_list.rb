module EdgeList
    def build_edge_list     
        completed_list = []   
        for x in 0..7
            for y in 0..7
                completed_list << [[x, y], [x - 2, y - 1]] unless (x - 2 < 0 || y - 1 < 0)
                completed_list << [[x, y], [x - 2, y + 1]] unless (x - 2 < 0 || y + 1 > 7)                 
                completed_list << [[x, y], [x + 2, y - 1]] unless (x + 2 > 7 || y - 1 < 0)
                completed_list << [[x, y], [x + 2, y + 1]] unless (x + 2 > 7 || y + 1 > 7)                 
                completed_list << [[x, y], [x - 1, y - 2]] unless (y - 2 < 0 || x - 1 < 0)
                completed_list << [[x, y], [x + 1, y - 2]] unless (y - 2 < 0 || x + 1 > 7)
                completed_list << [[x, y], [x - 1, y + 2]] unless (y + 2 > 7 || x - 1 < 0)                 
                completed_list << [[x, y], [x + 1, y + 2]] unless (y + 2 > 7 || x + 1 > 7)           
            end
        end
        completed_list
    end

    def legal_moves(coordinates)
        moves = []
        @edge_list.each do |data|
            moves << data[1] if data[0] == coordinates 
        end
        moves
    end

    def display_edge_list
        @edge_list.each do |data|
            puts "#{data}"
        end
    end 

    def count_edge_list
        counter = edge_list.length
        @edge_list.each do |item|
            counter += item.length
        end
        counter
    end
end