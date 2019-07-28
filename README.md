# Project Knights Travails - Path Finding
The goal of this project is to use a graph data structure to search for the shortest path between two sets of coordinates for a chess knight. The knight must move from its current position to its final position in the least amount of moves. All moves made must be legal moves and the knight must stay on the board. A legal move for a knight is to move two spots in any direction and then one spot to the left/right or up/down. 

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

3) Now start up IRB by typing irb and hitting enter.

4) Require in the script by typing require "./main.rb" and you should get the following screen. 

![screen shot](https://github.com/BShowen/Knights_travails/blob/master/screenshots/screenshot_1.png "screen shot")

Have fun with it. Create your own Knight object with `knight = Knight.new` then set the coordinates to whatever you want with `knight.current_position = [0,3]` `knight.desired_position = [3,9]` and then get the shortest path with `knight.knight_moves(knight.current_position, knight.desired_position)`

Thanks for checking it out! 
