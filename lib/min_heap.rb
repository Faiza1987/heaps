class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    heap_node = HeapNode.new(key, value)
    @store.push(heap_node)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    swap(0, @store.length - 1)
    removed_node = @store.pop
    heap_down(0)
    return removed_node.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    if @store.empty?
      return
    end
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    parent_index = (index - 1) / 2

    if parent_index >= 0
      if @store[parent_index].key > @store[index].key
        swap(parent_index, index)
        heap_up(parent_index)
      end
    end
    return
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2

    if @store[left_child].nil?
      return
    end

    if @store[right_child].nil?
      if @store[left_child].key < @store[index].key
        swap(index, left_child)
      end
      return
    end

    if @store[left_child].key < @store[right_child].key
      swap(index, left_child)
      heap_down(left_child)
    else
      swap(index, right_child)
      heap_down(right_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end