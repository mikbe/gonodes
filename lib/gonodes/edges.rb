module GoNodes
  
  class Edges

    attr_reader :edges
    
    def initialize
      @edges = []
    end
    
    def generate_from_count(edges)
      maximum_edges = (@nodes.count * (@nodes.count - 1)) / 2
      @completeness = (edges.to_f / maximum_edges).round(2)
      @edges = Array.new(edges)
    end

    def generate_from_completeness(completeness)
      maximum_edges = (@nodes.count * (@nodes.count - 1)) / 2
      edges = (maximum_edges * completeness).to_i if completeness

      @completeness = (edges.to_f / maximum_edges).round(2)
      @edges = Array.new(edges)
    end
    
  end
  
end