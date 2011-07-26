module GoNodes
  
  class Node
    
    attr_reader :name
    
    def initialize(name=nil)
      raise GoNodes::Errors::BadNodeName, 
        "Nodes may only be named using a symbol, string, or number" unless 
        [NilClass, String, Symbol].include?(name.class) || name.is_a?(Numeric)
      
      @name = name ? name : self.object_id
    end
    
    def to_s
      @name
    end
    
    def ==(other_node)
      self.name == other_node.name
    end
  
    def <=>(other_node)
      self.name <=> other_node.name
    end
  
  end
  
end
