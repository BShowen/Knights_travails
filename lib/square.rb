class Square
    attr_accessor :color, :character

    def initialize 
        @character = nil
        @color = nil
    end

    def empty?
        @character == nil
    end
end 