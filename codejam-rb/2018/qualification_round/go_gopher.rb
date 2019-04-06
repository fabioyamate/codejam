def out(s)
  puts s
  STDOUT.flush
end

def read_int
  gets.chomp.to_i
end

def read_two_int
  gets.chomp.split(" ").map(&:to_i)
end

File.open('go_gopher.log', 'w') do |f|
  cases = read_int
  f.puts cases

  (1..cases).each do |c|
    a = read_int
    f.puts a
    out "10 10"
    x,y = read_two_int
    f.puts "#{x} #{y}"
    out "20 20"
  end
end
