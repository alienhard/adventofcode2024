input = File.read('input').split("\n")

def parse_multiplication(input)
  input.scan(/mul\((\d+),(\d+)\)/).map do |num1, num2|
    num1.to_i * num2.to_i
  end
end

test_cases = {
  "mul(44,46)": 2024,
  "mul(123,4)": 492,
  "mul(12d3,4)": nil,
  "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))": 161,
}

test_cases.each do |test_case, expected_result|
  result = parse_multiplication(test_case.to_s).reduce(:+)
  if result == expected_result
    puts("SUCCESS: #{test_case} => #{result}")
  else
    puts("FAILURE: Got #{test_case} => #{result}. Expected: #{expected_result}")
  end
end

result = parse_multiplication(input.to_s).reduce(:+)
puts "Result: #{result}"

# Part 2

def parse_multiplication_2(input)
  expanded_input = "do()#{input}don't()"
  expanded_input.scan(/do\(\)(.*?)don't\(\)/).flatten.map do |match|
    parse_multiplication(match)
  end
end

puts parse_multiplication_2("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))").flatten.reduce(:+)

puts "Result 2: #{parse_multiplication_2(input).flatten.reduce(:+)}"