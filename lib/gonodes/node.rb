module GoNodes
  
  class Node
    
    attr_reader :name
    
    def initialize(name=nil)
      @name = name ? name : self.object_id
    end
    
  end
  
end
