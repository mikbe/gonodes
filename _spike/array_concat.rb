require 'benchmark'

n = 5000000

Benchmark.bmbm do |x|
  
  x.report {a = []; n.times {a << "ABCDEFG"} }
  x.report {a = Array.new(n); n.times {|index| a[index] = "ABCDEFG"} }
  
end

