module GoNodes
  
  class Node
    
    attr_reader :name
    
    def initialize(name=nil)
      raise GoNodes::Error::BadNodeName, "Nodes may only be named using a symbol, string, or number" unless 
        [NilClass, String, Symbol].include?(name.class) || name.is_a?(Numeric)
      
      @name = name ? name : self.object_id
    end
    
  end
  
end
