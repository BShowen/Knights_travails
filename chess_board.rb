class ChessBoard
   
    def initialize
        @board = [[0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7],
                            [0,1,2,3,4,5,6,7]]
        @square
    end

    def square(x,y)
        # x == row, y == column)
        return @board[x][y] 
    end

    def assign_square(x,y,value)
        @board[x][y] = value
    end

end