require 'forwardable'

module GoNodes
  
  class Graph

    attr_reader :completeness, :nodes, :edges
    
    def initialize(args={})
      
      @nodes = NodeList.new
      @nodes.populate_with_count(args[:node_count])  if args[:node_count]
      @nodes.populate_with_names(args[:node_names])  if args[:node_names]
      
      @edges = EdgeList.new(@nodes)
      @edges.generate_edges(args[:completeness])     if args[:completeness]
      
    end

  end
  
end


