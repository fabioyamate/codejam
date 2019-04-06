s="ONONENNNNOEOEIEE"

def score( array )
  hash = Hash.new(0)
  array.each_char{|key| hash[key] += 1}
  hash
end

def rem(m,l,n)
  k = m[l] - n
  if k == 0 then m.delete(l) else m[l] = k end
end

def solve(s)
  d = []
  scores = score(s)
  if c = scores["Z"] and c > 0
    d << [0]*c
    rem(scores, "E", c)
    rem(scores, "Z", c)
    rem(scores, "R", c)
    rem(scores, "O", c)
  end

  if c = scores["W"] and c > 0
    d << [2]*c
    rem(scores, "T", c)
    rem(scores, "W", c)
    rem(scores, "O", c)
  end

  if c = scores["U"] and c > 0
    d << [4]*c
    rem(scores, "F", c)
    rem(scores, "O", c)
    rem(scores, "U", c)
    rem(scores, "R", c)
  end

  if c = scores["X"] and c > 0
    d << [6]*c
    rem(scores, "S", c)
    rem(scores, "I", c)
    rem(scores, "X", c)
  end

  if c = scores["G"] and c > 0
    d << [8]*c
    rem(scores, "E", c)
    rem(scores, "I", c)
    rem(scores, "G", c)
    rem(scores, "H", c)
    rem(scores, "T", c)
  end

  if c = scores["O"] and c > 0
    d << [1]*c

    rem(scores, "O", c)
    rem(scores, "N", c)
    rem(scores, "E", c)
  end

  if c = scores["H"] and c > 0
    d << [3]*c
    rem(scores, "T", c)
    rem(scores, "H", c)
    rem(scores, "R", c)
    rem(scores, "E", 2*c)
  end

  if c = scores["F"] and c > 0
    d << [5]*c
    rem(scores, "F", c)
    rem(scores, "I", c)
    rem(scores, "V", c)
    rem(scores, "E", c)
  end

  if c = scores["V"] and c > 0
    d << [7]*c
    rem(scores, "S", c)
    rem(scores, "E", 2*c)
    rem(scores, "V", c)
    rem(scores, "N", c)
  end

  if c = scores["E"]
    d << [9]*c
  end

  d.flatten.sort.join
end

File.readlines('A-large.in').each_with_index do |line, index|
  next if index == 0
  puts "Case ##{index}: #{solve(line)}"
end
