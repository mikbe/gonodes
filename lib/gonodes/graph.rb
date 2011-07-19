require 'forwardable'

module GoNodes
  
  class Graph

    attr_reader :completeness
    
    def initialize(args={})
      
      @node_list = NodeList.new
      @edge_list = EdgeList.new

      @node_list.populate_with_count(args[:node_count])  if args[:node_count]
      @node_list.populate_with_names(args[:node_names])  if args[:node_names]
      
      @edge_list.generate_edges(args[:completeness])     if args[:completeness]
      
    end

    def nodes
      @node_list.nodes
    end
    
    def edges
      @edge_list.edges
    end

  end
  
end


