require "colorize"
require_relative "square.rb"
class Board

    def initialize 
        @object_board = Array.new(8){Array.new(8){Square.new}}
        @display_board = []
    end

    def to_s
        @display_board = Marshal.load(Marshal.dump(@object_board))
        convert_each_square_to_string
        add_borders_and_numbers_to_board
        @display_board.join
    end

    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        @object_board[7 - row][column]
    end

    private
    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                if square.color
                    color = square.color
                    square.empty? ? "   ".colorize(:background => color) : square.character.center(3).colorize(:background => color)
                else
                    square.empty? ? "   " : square.character.center(3)
                end
            end
        end
    end

    def add_borders_and_numbers_to_board
        @display_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} | #{7 - index}\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n"
        end
        @display_board.unshift("  |-----|-----|-----|-----|-----|-----|-----|-----|\n")
        @display_board.push("     0     1     2     3     4     5     6     7     ")
    end 
end
