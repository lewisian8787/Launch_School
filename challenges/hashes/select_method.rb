family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
siblings = family.select { |members, names| [:sisters, :brothers].include?(members) }.values.flatten 
puts siblings
