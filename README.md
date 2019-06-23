# Project Knights Travails
Take a Knight from the game Chess and create a function that accepts the Knights starting position and desired ending position. The function returns the shortest possible path the knight can take to get to the desired position by using only legal moves. The chess board is represnted as having 2-dimensional coordinates. So for example, my function `knight_moves([0,0],[3,3])` accepts a start and end positon as coordinates [0,0] and [3,3] respectively. In this case the function will return `[[0,0],[1,2],[3,3]]` which is the shortest path to get from [0,0] to [3,3] with legal moves. 

Here are a few more examples of the function taking in coordinates and returning the path. 
```
knight_moves([0,0],[1,2])     #=> [[0,0],[1,2]]
knight_moves([0,0],[3,3])    #=> [[0,0],[1,2],[3,3]]
knight_moves([3,3],[0,0])    #=> [[3,3],[1,2],[0,0]]
```

## Explanation of my files
I created this script as modular as I know how to in order to keep my code clean, easy to read and understand, and also maintainable (I will be creating chess in the near future). 

**knight.rb** This is the Knight class. 
**game_piece.rb** This is the parent class to Knight. 
**adjacency_list.rb** This is the data structure that I chose to represent my Knight. AdjacencyList is mixed into the Knight class. 
**my_queue.rb** This is a Queue. I use it to perform a breadth first search (or level order traversal) on the adjacency list. 
