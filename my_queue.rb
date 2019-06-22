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

    def self.clear_queue
        $queue.clear
    end
    
end