# Project Knights Travails - Path Finding
The goal of this project is to use a graph data structure to search for the shortest path between two sets of coordinates for a chess knight. The knight must move from its current position to its final position in the least amount of moves. All moves made must be legal moves and the knight must stay on the board. A legal move for a knight is as follows: Move 2 spots in any direction and then 1 spot perpendicular to that direction. Or, move 1 spot in any direction and then 2 spots perpendicular to that direction. 

# Example. 
This screenshot shows the application when it is given (0,0) as the starting position and (7,7) as the ending position. The shortest path between these two points requires 4 moves. 
<!-- ![screen shot](https://github.com/BShowen/Knights_travails/blob/master/screenshots/screenshot_1.png "screen shot") -->
![screen shot](https://github.com/BShowen/Knights_travails/blob/master/screenshots/screenshot_1.gif "screen shot")

## How it works
I use an adjacency list to store the legal moves that can be made from each individual square on the chess board (64 squares in total). A breadth first search through the adjacency list is performed in order to find the shortest possible path between two nodes: The knights current position, and the knights desired ending position. 

## Explanation of files
I created this script as modular as possible in order to keep my code clean, understandable and easy to maintain. My organization here may be over kill. 

**knight.rb** This is the Knight class. 

**game_piece.rb** This is the parent class to Knight. 

**adjacency_list.rb** This is the data structure that I chose to represent my Knight. AdjacencyList is mixed into the Knight class. 

**my_queue.rb** This is a Queue. I use it to perform a breadth first search (or level order traversal) on the adjacency list. 

**main.rb** Creates a Knight object and calls its functions. 

## Instructions 
##### These instructions assume you are using Ruby 2.5.1 on macOS. You may encounter an error if you use a different OS or a different version of Ruby.
1) Clone or download ths repo onto your computer by clicking the "clone or download" button at the top right of this page.

2) Open terminal and cd into the directory where you have this repo downloaded.

3) Now type "ruby main.rb" without the quotes. Enjoy! 

Thanks for checking it out! 
