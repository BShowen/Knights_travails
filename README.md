# Project Knights Travails
The goal of this project is to use a graph data structure to search for the shortest path between two squares for a chess knight.

## How it works
I use an adjacency list to store the legal moves that can be made from each individual square on the chess board (64 squares in total). I perform a breadth first search through the adjacency list to find the shortest possible path between two points, the knights current position and desired ending position. 

## Explanation of files
I created this script as modular as possible in order to keep my code clean, easy to understand, and also maintainable. My organization here may be over kill. 

**knight.rb** This is the Knight class. 

**game_piece.rb** This is the parent class to Knight. 

**adjacency_list.rb** This is the data structure that I chose to represent my Knight. AdjacencyList is mixed into the Knight class. 

**my_queue.rb** This is a Queue. I use it to perform a breadth first search (or level order traversal) on the adjacency list. 
