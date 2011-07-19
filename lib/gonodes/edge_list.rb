module GoNodes
  
  class EdgeList

    attr_reader :edges
    
    def initialize
      @edges = []
    end
    
    def populate_with_count(edges)
      node_list, completeness = args[:node_list, :completeness]
      
      maximum_edges = (node_list.count * (node_list.count - 1)) / 2
      
      @completeness = (edges.to_f / maximum_edges).round(2)
      @edges = Array.new(edges)
    end

    def populate_with_completeness(args)
      node_list, completeness = args[:node_list], args[:completeness]
      
      maximum_edges = (node_list.nodes.count * (node_list.nodes.count - 1)) / 2
      edges = (maximum_edges * completeness).to_i if completeness

      @completeness = (edges.to_f / maximum_edges).round(2)
      @edges = Array.new(edges)
    end
    
  end
  
end