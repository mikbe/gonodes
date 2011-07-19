module GoNodes

  class NodeList
    include Enumerable

    attr_accessor :nodes

    def initialize
      @nodes = []
    end

    def populate_with_count(node_count)
      return unless node_count
      alpha = "@"
      @nodes = node_count.times.collect {alpha.succ!; Node.new(alpha)}
    end

    def populate_with_names(node_names)
      return unless node_names
      @nodes = node_names.collect {|name| Node.new(name)}
    end

  end
  
end
