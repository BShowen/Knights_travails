module Stack
    
    $stack = []

    def self.stack
        $stack
    end
    
    def self.pop
        $stack.shift
    end
    
    def self.push(data)
        $stack.unshift(data)
    end
end