lines = $stdin.read.split("\n")

cases = lines.shift

def frequencies(input)
  input.each_char.reduce(Hash.new(0)) { |s,c| s[c] += 1; s }
end

def in2power(input)
  res = input.each_char.reduce([[],1]) do |(xs,power),i|
    if i == 'S' then
      xs << power
      [xs,power]
    else
      [xs, power * 2]
    end
  end
  res[0]
end

lines.each_with_index do |row,i|
  d,input = row.split(" ")
  d = d.to_i

  freq = frequencies(input)
  swaps = 0

  if freq['S'] > d then
    swaps = "IMPOSSIBLE"
  else
    nums = in2power(input)
    if nums.reduce(0, :+) > d then
      loop do
        last = nums.pop
        swaps += 1
        break if nums.reduce(0, :+) + last/2 <= d
        nums << (last / 2)
        nums.sort!
      end
    end
  end
  puts "Case ##{i+1}: #{swaps}"
end
