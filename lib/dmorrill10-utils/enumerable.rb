module Enumerable
  # @return [Integer] Sum of the elements in this instance. All elements must
  #  have a +to_i+ method, which converts the element into a form that may be
  #  summed with an +Integer+.
  def sum
    flatten.inject(0){ |sum, element_amount| sum += element_amount.to_i }
  end

  # @return [Array] The array resulting from summing all elements in
  #  this instance. All elements must have a +sum+ or +to_i+ method.
  def mapped_sum
    map { |element| if element.respond_to? :sum then element.sum else element.to_i end }
  end
end