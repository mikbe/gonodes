module GoNodes

  class NodeList < DelegateClass(Set)

    def initialize
      @nodes = Set.new
      super(@nodes)
    end

    def to_s
      to_a.join(", ")
    end

    def self.new_with_count(count)
      node_list = NodeList.new
      node_list.populate_with_count(count)
      node_list
    end

    def self.new_with_names(names)
      node_list = NodeList.new
      node_list.populate_with_names(names)
      node_list
    end

    def add(node)
      super(node.is_a?(Node) ? node : Node.new(node))
    end
    
    def [](node_name)
      select{|node,_| node.name == node_name}.first
    end

    def ==(other_node_list)
      sort == other_node_list.sort
    end

    def populate(population)
      population.is_a?(Fixnum) ? 
        populate_with_count(population) : 
        populate_with_names(population)
    end

    def populate_with_count(node_count)
      alpha = "A"
      clear
      node_count.times do
        self << Node.new(alpha)
        alpha = alpha.succ
      end
    end

    def populate_with_names(node_names)
      clear
      node_names.each { |name| self << Node.new(name)}
    end

  end
  
end
