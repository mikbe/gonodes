# GoNodes
An easy way to create simple, weighted graphs. Even randomly populated ones!

## Description
If you need to create simple (in the mathematical sense), weighted graphs with random values for the connections and weights then this is the gem for you.

## Install
`$ gem install GoNodes`

## Instructions
The main entry into the app is the GoNodes::Graph class so I'll only cover that class here. To learn how to customize usage of the library check out the specs.

### GoNodes::Graph
To create your graph you might initialize a new instance like so:  

    graph = GoNodes::Graph.new(
          node_count: 4, 
        completeness: 0.5,
        random_edges: true,
      random_weights: {median: 10, range: 4}
    )

#### GoNodes::Graph Parameters
**node_count:**  
*integer*  
How many nodes there will be in the graph.  

**completeness:**  
*float*  
The percentage of connectivity between the nodes with. A complete graph has an edge going from every node to every other node. For instance if you had 5 nodes then you would have 10 edges.  

1.0 would be 100% complete  
0.25 would be 25% complete  

**random\_edges:**  
*boolean*  
If this is set to true then edges will be randomly generated between nodes instead of being created in a repeatable manner.  

**random\_weights:**  
*(hash of values)*  
To create random weights between for your edges you can specify the median  value and how much to randomly deviate from that number. So if you had a median of 10 and a range of 4 then your weights assigned to your edges would be from 8 to 12 inclusively.  

## Example usage

    # A complete, simple graph with all nodes connected
    graph = GoNodes::Graph.new(node_count: 12)
    puts graph

    # A full graph with all the features used
    graph = GoNodes::Graph.new(
          node_count: 8, 
        completeness: 0.5,
        random_edges: true,
      random_weights: {median: 50, range: 10}
    )
    puts graph

## License
Copyright (c) 2011 Mike Bethany  

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  