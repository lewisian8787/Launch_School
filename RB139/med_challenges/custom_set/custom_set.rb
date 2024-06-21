class CustomSet
  attr_reader :elements

  def initialize(*elements)
    @elements = elements.flatten.uniq.sort
  end

  def to_s
    @elements
  end 

  def empty?
    @elements.empty?
  end

  def contains?(number)
    @elements.flatten.include?(number)
  end

  def subset?(other_set)
    @elements.all? { |element| other_set.elements.include?(element) }
  end

  def disjoint?(other_set)
    @elements.all? { |element| !other_set.elements.include?(element) }
  end

  def eql?(other_set)
    return false if elements.length != other_set.elements.length
    elements == other_set.elements
  end
  
  def add(element)
    @elements << element unless @elements.include?(element)
    self # Return self to allow chaining but also to modify the current set
  end
  
  def ==(other_set)
    elements.sort == other_set.elements.sort
  end
  
  def intersection(other_set)
    intersection = []
    elements.each {|el| intersection << el if other_set.elements.include?(el)}
    CustomSet.new(intersection)
  end
  
  def difference(other_set)
    difference = []
    elements.each {|el| difference << el if !other_set.elements.include?(el)}
    CustomSet.new(difference)
  end
  
  def union(other_set)
    union = (elements + other_set.elements).flatten.uniq.sort
    CustomSet.new(union)
  end 

end