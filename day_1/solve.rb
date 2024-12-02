input = File.read('input').split("\n")
left = []
right = []

# Part 1
distance = 0
input.each do |line|
  locations = line.split(" ")
  left.push(locations[0].to_i)
  right.push(locations[1].to_i)
end

left.sort!
right.sort!

left.zip(right).each do |l, r|
  distance += (l - r).abs
end

puts "Distance: #{distance}"

# Part 2
right_histogram = Hash.new(0)
right.each do |r|
  right_histogram[r] += 1
end

similarity = 0
left.each do |l|
  similarity += l * right_histogram[l]
end

puts "Similarity: #{similarity}"