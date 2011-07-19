def granny_parser(text)
  return "Speak up! I'm deaf!" unless text.upcase == text

 # do whatever you're doing to the text
 "Blah, blah, blah"
end

puts "Oh, hello grandchild, I didn't see you there, what's that you say? You'll have to yell, I'm a little deaf."
puts "(type in all CAPITAL letters for granny to hear you)"
while true
  input = gets.chomp
  break if input == "BYE"
  puts granny_parser(input)
end


