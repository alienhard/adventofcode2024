input = File.read('input').split("\n")
reports = input.map { |line| line.split(" ").map(&:to_i) }

def check_safety_condition(a, b, increasing)
  return false if (a - b).abs > 3 || a == b
  return false if increasing && a > b
  return false if !increasing && a < b
  true
end
def is_safe(report)
  increasing = report[0] < report[1]
  report[0..-2].zip(report[1..-1]).each do |a, b|
    return false unless check_safety_condition(a, b, increasing)
  end
  return true
end

safe = reports.count { |report| is_safe(report) }

puts "Safe Part 1: #{safe}"
