cases = gets.chomp.to_i

(1..cases).each do |c|
  n = gets.chomp.to_i
  xs = gets.chomp.split(" ").map(&:to_i)
  # expected = gets.chomp

  done = false
  result = "OK"
  while not done
    done = true
    0.upto(n-3) do |i|
      if xs[i] > xs[i+2]
        done = false
        tmp = xs[i]
        xs[i] = xs[i+2]
        xs[i+2] = tmp
      end
      if xs[i+1] > xs[i+2]
        if !xs[i+3]
          done = true
          result = i+1
        elsif xs[i+1] < xs[i+3]
          done = true
          result = i+2
        end
      elsif xs[i] > xs[i+1]
        if !xs[i+3]
          done = true
          result = i+1
        elsif xs[i+1] < xs[i+3]
          done = true
          result = i+2
        end
      end
    end
  end

  # verification = expected == result.to_s
  # puts "Case ##{c}: #{result} (#{verification})"
  puts "Case ##{c}: #{result}"
end
