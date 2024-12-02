import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  // Splits input data into its component parts and convert from string.
  var lists: [[Int]] {
    var list1: [Int] = []
    var list2: [Int] = []
    
    data.split(separator: "\n").forEach {
      let components = $0.split(separator: " ")
      list1.append(Int(components[0]) ?? 0)
      list2.append(Int(components[1]) ?? 0)
    }
    
    return [list1, list2]
  }
  
  func part1() -> Any {
    let list1 = lists[0].sorted()
    let list2 = lists[1].sorted()
    
    return zip(list1, list2).reduce(0) { partialResult, zipSequence in
      partialResult + abs(zipSequence.0 - zipSequence.1)
    }
    
  }
  
  func part2() -> Any {
    let list1 = lists[0]
    let list2 = lists[1]
    
    return list1.reduce(0) { partialResult, ele in
      partialResult + list2.count(where: { $0 == ele }) * ele
    }
  }
}
