class Flatten
  def initialize(input)
    @array = input || []
  end

  def perform
    flatten @array
  end

  protected

  # Flattens an array by iterating over each element, and
  # when finding an array, recursively calls itself on the
  # nested array, other wise adds to existing results
  def flatten(array)
    result = []
    array.each do |elem|
      if elem.is_a? Array
        result += flatten(elem)
      else
        result << elem
      end
    end

    result
  end
end

