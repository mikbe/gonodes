require "delegate"

module GoNodes

  class NodeList < DelegateClass(Array)

    def initialize
      @nodes = []
      super(@nodes)
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
    
    def populate_with_count(node_count)
      return unless node_count
      alpha = "A"
      @nodes.clear
      node_count.times do
        @nodes << Node.new(alpha)
        alpha = alpha.succ
      end
    end

    def populate_with_names(node_names)
      return unless node_names
      @nodes.clear
      node_names.each { |name| @nodes << Node.new(name)}
    end

  end
  
end
