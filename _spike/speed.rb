# 1 = A ... 26 = Z, 27 = AA, 28 = AB ... etc
def alpha_new(number)
  "A".tap {|a| (number-1).times {a.succ!}}
end

def alpha_old(number)
 alpha = ""
 begin
   alpha << ((number-=1) % 26) + 65
 end while (number /= 26) > 0
 alpha.reverse
end
#puts alpha_old(64 * 1024)

# t = Time.now
# (20000).times {|x| alpha_new(x) }
# puts Time.now - t

# t = Time.now
# (10000).times {|x| alpha_new(x) }
# puts Time.now - t
# => 20.895054

t = Time.now
(5000).times {|x| alpha_old(x) }
puts Time.now - t
# => 0.011024