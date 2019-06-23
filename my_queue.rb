module MyQueue

    $queue = []
    
    def self.queue
        $queue
    end

    def self.dequeue
        $queue.shift
    end

    def self.enqueue(data)
        $queue << data
    end

    def self.check_for_doubles_then_enqueue(coordinates, visited_coordinates)
        coordinates.each do |coordinate|
            next if (visited_coordinates.include?(coordinate) || self.queue.include?(coordinate))
            self.enqueue(coordinate)
        end
    end

    def self.clear_queue
        $queue.clear
    end
    
end