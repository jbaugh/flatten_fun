require_relative 'flatten'


# To run tests: ruby flatten_test.rb

def assert_true(expr)
  raise "Test failed" unless expr
end

puts "Running tests."
assert_true(Flatten.new(nil).perform == [])
assert_true(Flatten.new([]).perform == [])
assert_true(Flatten.new([1,2,3]).perform == [1,2,3])
assert_true(Flatten.new([1,2,[3]]).perform == [1,2,3])
assert_true(Flatten.new([1,2,[3, 4], 5]).perform == [1,2,3,4,5])
assert_true(Flatten.new([1,2,[3, 4], 5, [], 1]).perform == [1,2,3,4,5,1])
puts "Test done."