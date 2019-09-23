require_relative './min_heap';

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.empty? || list.length == 1

  minHeap = MinHeap.new()

  until list.empty?
    minHeap.add(list.pop)
  end

  until minHeap.empty?
    list << minHeap.remove
  end

  return list
end