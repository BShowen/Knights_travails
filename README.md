# Project Knights Travails
Take a Knight from the game Chess and create a function that accepts the Knights starting position and desired ending position. The function returns the shortest possible path the knight can take to get to the desired position by using only legal moves. The chess board is represnted as having 2-dimensional coordinates. So for example, my function `knight_moves([0,0],[3,3])` accepts a start and end positon as coordinates [0,0] and [3,3] respectively. In this case the function will return `[[0,0],[1,2],[3,3]]` which is the shortest path to get from [0,0] to [3,3] with legal moves. 

Here are a few more examples of the function taking in coordinates and returning the path. 
```
knight_moves([0,0],[1,2])    #=> [[0,0],[1,2]]
knight_moves([0,0],[3,3])    #=> [[0,0],[1,2],[3,3]]
knight_moves([3,3],[0,0])    #=> [[3,3],[1,2],[0,0]]
```

## Explanation of my files
I created this script as modular as I know how to in order to keep my code clean, easy to read and understand, and also maintainable (I will be creating chess in the near future). 

**knight.rb** This is the Knight class. 

**game_piece.rb** This is the parent class to Knight. 

**adjacency_list.rb** This is the data structure that I chose to represent my Knight. AdjacencyList is mixed into the Knight class. 

**my_queue.rb** This is a Queue. I use it to perform a breadth first search (or level order traversal) on the adjacency list. 

## The Knight class 
First a knight is instantiated from the Knight class. There are a few variables set during initialization of the Knight. They are...
```
@current_position = [nil,nil]
@desired_position = [nil,nil]
@adjacency_list = build_adjacency_list
@visited_coordinates = []
@final_coordinates = []
```
1) The @current_position and @desired_position can be changed anytime by using attr_accessor's. 
2) @adjacency_list is set to `build_adjacency_list` which is a function that creates and returns an adjacency list. Details below. 
3) @visited_coordinates is used when we iterate over the adjacency list. Details below. 
4) @final_coordinates is used when we iterate over @visited_coordinates. Details below. 

## The Adjacency List
If we start at the bottom left corner of a chess board and work our way to the right and go all the way to the top right corner of the board we would have 64 squares. We can number those squares 0 through 63 and store those squares as individual sub arrays in an adjacency list, each square is an array holding some data about the square. The data will be coordinates to legal moves you can make from that square and that square only. In a data structure like this we would have one array (the adjacency list) with 64 sub arrays inside. Each sub array would hold the corrdinates to the legal moves from the square it self. Lets see an example of this but for simplicity we will only represent the very bottom row of a chess board. 
```
bottom_row = [[[2, 1], [1, 2]]
            [[2, 0], [2, 2], [1, 3]]
            [[2, 1], [2, 3], [1, 0], [1, 4]]
            [[2, 2], [2, 4], [1, 1], [1, 5]]
            [[2, 3], [2, 5], [1, 2], [1, 6]]
            [[2, 4], [2, 6], [1, 3], [1, 7]]
            [[2, 5], [2, 7], [1, 4]]
            [[2, 6], [1, 5]]]
```
Now if we want to see all the legal moves we can make from any square in the bottom row all we have to do is index into the adjacency list. The index number will be the square you want. For example if you want to see all the legal moves you can make from square 0 (the very bottom left corner) you simply call `bottom_row[0]`. Want to see the legal moves you could make from sqaure 7 (the very bottom right corner), call `bottom_row[7]`. The results for these would be
```
bottom_row[0] #=> [[2, 1], [1, 2]]
bottom_row[7] #=> [[2, 6], [1, 5]]
```