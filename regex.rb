# simple program for one question using regex
# the regex is a little complicated so I've broken it down at the end, copy and paste into a ruby file and run it.

hash = {question: "Who's your mama? A. Rosanne B. Peggy C. Carol", answer: "B"}

puts hash[:question]
user_input = gets.chomp.downcase
correct_answer = /(?<=[#{hash[:answer]}][.] )\b(.+?)(?=\b)/.match(hash[:question]).to_s.downcase

if user_input == correct_answer || user_input == hash[:answer].downcase
  puts "Correct!!!"
else
  puts "Sorry, You're wrong. Not your answer...you are just wrong."
end

# the regex I used in this was from ruby docs http://ruby-doc.org/core-2.2.0/Regexp.html and http://www.rexegg.com/regex-quantifiers.html
# Note: that if I change how my question string or my answer string is written my regex will break

# Begining
# I'm looking for the word following my answer letter(which also has a period and a space)
# (?<=pattern) - I started with a Positive lookbehind assertion, which looks for anything following the "pattern" but does not include the "pattern"
# (?<=[#{hash[:answer]}]) - I then interpolated my hash[:answer]
# (?<=[#{hash[:answer]}][.] ) - followed by a dot(period) and a space

# Middle
# \b - this is a word boundry allowing me to start my match pattern at the begining of the word
# . - stands for any character in the string
# .+ - adding the plus repeats as long as there is another that matches the pattern. It finds the longest possible match, in this case our dot for any character. So as long as there's another character it keeps gobbling them up.
# .+? - we want our regex to be more choosey, the question mark literally means non-greedy or lazy. this looks for the shortest match that completes the overall pattern of our regex.
# \b(.+?) - all together that's a word boundary followed by any number of characters but as little as it needs to complete over all pattern

# The end
# we have to tell that lazy pattern(?) to stop, so it doesn't take on the whole string
# (?=\b) - Positive lookahead assertion combined with Any word boundary, is similar to our Positive Lookbehind assertion

# then let's put it together, that's our regex
# (?<=[#{hash[:answer]}][.] )\b(.+?)(?=\b)