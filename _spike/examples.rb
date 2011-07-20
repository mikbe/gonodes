$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
require 'gonodes'

# A complete, simple graph with all nodes connected
graph = GoNodes::Graph.new(node_count: 12)
puts graph

# A full graph with all the features used
graph = GoNodes::Graph.new(     node_count: 8, 
                              completeness: 0.5,
                              random_edges: true,
                            random_weights: {median: 50, range: 10}
                          )
puts graph
