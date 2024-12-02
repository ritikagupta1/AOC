import Algorithms

struct Day02: AdventDay {
  
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  // Splits input data into its component parts and convert from string.
  var lists: [[Int]] {
    return data.split(separator: "\n").compactMap { component in
      component.split(separator: " ").compactMap{ Int($0)}
    }
  }
  
  func part1() -> Any {
    var count = 0
    for arr in lists {
      if isValidResult(completion: isIncreasing(ele1:ele2:), arr: arr) || isValidResult(completion: isDecreasing(ele1:ele2:), arr: arr) {
        count += 1
      }
    }
    return count
  }
  
  
  func isValidResult(completion: (Int,Int) -> Bool, arr: [Int], toleranceLevel: Int = 0) -> Bool {
    for index in 0..<arr.count - 1 {
      let res = completion(arr[index], arr[index+1])
      if  !res && toleranceLevel == 1 {
        var newArr1 = arr
        var newArr2 = arr
        newArr1.remove(at: index)
        newArr2.remove(at: index + 1)
        
        return (isValidResult(completion: completion, arr: newArr1) || isValidResult(completion: completion,arr: newArr2))
      } else if !res {
        return false
      }
    }
    return true
  }
 
  
  func isDecreasing(ele1: Int, ele2: Int) -> Bool {
    (ele1 > ele2 && (ele1 - ele2 >= 1) && (ele1 - ele2 <= 3))
  }
  
  func isIncreasing(ele1: Int, ele2: Int) -> Bool {
    (ele1 < ele2 && (ele2 - ele1 >= 1) && (ele2 - ele1 <= 3))
  }
  
  
  func part2() -> Any {
    var count = 0
    for arr in lists {
      if isValidResult(completion: isDecreasing(ele1:ele2:), arr: arr, toleranceLevel: 1) || isValidResult(completion: isIncreasing(ele1:ele2:), arr: arr, toleranceLevel: 1) {
        count += 1
      }
    }
    return count
  }
}
