# It's not a really a base 26 number conversion
# 1 = A ... 26 = Z, 27 = AA, 28 = AB ... etc
def alpha_new(number)
  "A".tap {|a| (number-1).times {a.succ!}}
end

def alpha_old(number)
 alpha = ""
 begin
   number    -= 1
   remainder  = number % 26
   alpha     << remainder + 65
   number    /= 26
 end while number > 0
 alpha.reverse
end

# t = Time.now
# (20000).times {|x| alpha_new(x) }
# puts Time.now - t
I really, really don't want to use that method though because it's really:
t = Time.now
(10000).times {|x| alpha_new(x) }
puts Time.now - t
=> 20.895054

t = Time.now
(10000).times {|x| alpha_old(x) }
puts Time.now - t
=> 0.011024