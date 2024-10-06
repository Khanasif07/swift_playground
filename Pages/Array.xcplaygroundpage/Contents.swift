//: [Previous](@previous)

import Foundation
//: [Next](@next)
func largestElementInArray(_ nums: inout [Int]) -> Int{
    if !nums.isEmpty{
        var maxE = nums[0]
        for i in 1..<nums.count{
            maxE = max(maxE,nums[i])
        }
        return maxE
    }
    return 0
    
}
//var nums = [5,4,3,0,9,3,8]
//print(largestElementInArray(&nums))

func secondLargestElementInArray(_ nums: inout [Int]) -> Int{
    if !nums.isEmpty{
        var firstMaxE = nums[0]
        var secondMaxE = nums[0]
        for i in 1..<nums.count{
            if nums[i] > firstMaxE{
                firstMaxE = nums[i]
            }else if (nums[i] > secondMaxE) && (nums[i] != firstMaxE){
                secondMaxE = nums[i]
            }
        }
        return secondMaxE
    }
    return 0
}
//var nums1 = [5,4,3,0,9,3,8,9]
//print(secondLargestElementInArray(&nums1))

func removeDuplicatesfromSortedArray(_ nums: inout [Int]){
    var j  = 0
    if !nums.isEmpty{
        var prev = nums[0]
        for i in 1..<nums.count{
            if prev == nums[i]{
                nums[j] = nums[i]
                prev = nums[j]
                j += 1
            }else{
                nums[j] = nums[i]
                prev = nums[j]
            }
        }
    }
    print("distinct element: \(j)")
    print(nums)
}
//var nums2 = [1,1,2,2,3,3,3,4]
//print(removeDuplicatesfromSortedArray(&nums2))

func moveZerosToRight(_ nums: inout [Int]){
    var j = 0
    for i in 0..<nums.count{
        if nums[i] == 0{
            //do nothing...
        }else{
            nums.swapAt(i, j)
            j += 1
        }
    }
    print(nums)
}
//var nums3 = [0,0,0,1,0,0,3,0,3,4]
//print(moveZerosToRight(&nums3))


func findMaxConsecutiveOnes(_ nums: inout [Int]) -> Int{
    var currentMax = 1
    var maxValue = 0
    for i in 0..<nums.count-1{
        if nums[i] == 1 && nums[i+1] == 1{
            currentMax += 1
            maxValue =  max(maxValue,currentMax)
        }else{
            currentMax = 1
            maxValue =  max(currentMax,maxValue)
        }
    }
    return maxValue
}
//var nums4 = [0,0,1,1,1,0,1,3,1,1]
//print(findMaxConsecutiveOnes(&nums4))

//print("profit:-\(maxProfit([7,6,4,3,1,10]
func rotate(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    let steps = k % n  // Handle cases where k is greater than the array size
    // Edge case: If steps == 0, no rotation needed
    guard steps > 0 else { return }
    // Perform the rotation by rearranging the two parts of the array
    let rotatedPart = nums[(n - steps)...]      // Last 'steps' elements
    let remainingPart = nums[..<(n - steps)]    // First 'n - steps' elements
    nums = Array(rotatedPart) + Array(remainingPart) // Combine both parts
}
//var nums5 = [1, 2, 3, 4, 5, 6, 7]
//rotate(&nums5, 10)
//print(nums5)

//VVIMP:- n2,nlogn, n..
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (index, value) in nums.enumerated() {
        let diff = target - value
        if let j = map[diff] {
            return [index, j]
        }
        map[value] = index
        print(map)
    }
    return []
}

//var nums6 = [4,6,7,8,1]
//print("two sum:-\(twoSum(nums6, 5))")


//max subarray sum
func kadane(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    var maxSoFar = arr[0]
    var currentMax = arr[0]
    for i in 1..<arr.count {
        currentMax = max(arr[i], currentMax + arr[i])
        maxSoFar = max(maxSoFar, currentMax)
    }
    return maxSoFar
}

//let nums7 = [-2, 1, -3, 4, -2, 2, 1, -5, 4]
//let result = kadane(nums7)
//print("Maximum subarray sum: \(result)")


func segregate0_1_2_inArray(_ arr: inout [Int]){
    var start = 0
    var last = arr.count-1
    var mid = start
    while (mid<=last){
        switch arr[mid]{
        case 0:
//            swap(arr: &arr, i: start, j: mid)
            arr.swapAt(start, mid)
            start += 1
            mid += 1
            break
        case 1:
            mid += 1
            break
        case 2:
//            swap(arr: &arr, i: mid, j: last)
            arr.swapAt(mid, last)
            last -= 1
            break
        default:
            break
        }
    }
    print(arr)
}
var nums8 = [2,0,1,2,2,1,2,1,0,0,2,2,1,0]
//start and mid starts from 0, if zero comes swap  start and mid and increament both
// if 1 comes increament mid
// if 2 comes swap mid and last and  decreament last
//segregate0_1_2_inArray(&nums8)


//minSofar and profit --
func buyAndSellStock(){
    let arr = [5,2,6,1,4]
    var maxProfit = 0
    var minSoFar = arr[0]
    for i in 0..<arr.count{
        minSoFar = min(minSoFar, arr[i])
        let profit = arr[i] - minSoFar
        maxProfit = max(profit, maxProfit)
    }
    print(maxProfit)
}

//buyAndSellStock()

//count is even
//equal pos and neg in arr
//oupput arr starts from pos then nega again -> + - + -
func reArrangeArrayValueBySign(_ arr: inout [Int]){
    var plusPos:Int = 0
    var negPos = 1
    var output:[Int] = [Int](Array(repeating: 0, count: arr.count))
    for item in arr{
        if item > 0{
            output[plusPos] = item
            plusPos += 2
        }else{
            output[negPos] = item
            negPos += 2
        }
    }
    print(output)
}
//var nums9 = [-2,1,-5,3,4,-7]
//reArrangeArrayValueBySign(&nums9)

//need to try one more time..
func spiralMatrix(_ matrix: inout [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }
    
    var result = [Int]()
    
    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix[0].count - 1
    
    while top <= bottom && left <= right {
        // Traverse from left to right along the top row
        for i in stride(from: left, through: right, by: 1) {
            result.append(matrix[top][i])
        }
        print(result)
        top += 1
        
        // Traverse from top to bottom along the right column
        for i in stride(from: top, through: bottom, by: 1) {
            result.append(matrix[i][right])
        }
        print(result)
        right -= 1
        
        if top <= bottom {
            // Traverse from right to left along the bottom row
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            print(result)
            bottom -= 1
        }
        
        if left <= right {
            // Traverse from bottom to top along the left column
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            print(result)
            left += 1
        }
    }
    
    return result
}

//var nums10 = [[1,2,3],[4,5,6],[7,8,9]]
//print(spiralMatrix(&nums10))

//from right every El should be greater than right
func leadersOfArray(_ arr: inout [Int]) -> [Int]{
    var maxFromRight = 0
    var output = [Int]()
    for j in stride(from: arr.count-1, through: 0, by: -1){
        if arr[j] > maxFromRight{
            output.append(arr[j])
            maxFromRight = max(maxFromRight,arr[j])
        }
    }
    return output
}
//var nums11 = [16,17,4,3,5,2]//otp:- [17,5,2]
//print(leadersOfArray(&nums11))

func generatePascal(_ numRows: Int) -> [[Int]] {
    // Base case: if numRows is 0, return an empty array
    guard numRows > 0 else { return [] }
    var triangle = [[1]]
    // Generate rows from the 2nd to numRows
    for row in 1..<numRows {
        var newRow = [Int](Array(repeating: 1, count: row+1)) // Start and end each row with a '1
        let previousRow = triangle[row - 1]
        // Generate the middle values for the row
        for j in 1..<(row) {
            newRow[j] = (previousRow[j - 1] + previousRow[j])
        }
        triangle.append(newRow)
    }
    return triangle
}

let numRows = 5
//let result = generatePascal(numRows)
//print(result)
// Output: [
//   [1],
//   [1, 1],
//   [1, 2, 1],
//   [1, 3, 3, 1],
//   [1, 4, 6, 4, 1]
// ]

func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 0 else { return [] }
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    // Initialize the merged array with the first interval
    var merged: [[Int]] = [sortedIntervals[0]]
    // Loop through each interval in the sorted list
    for i in 1..<sortedIntervals.count {
        let current = sortedIntervals[i]
        let lastMerged = merged[merged.count - 1]
        // If the current interval overlaps with the last merged interval, merge them
        if current[0] <= lastMerged[1] {
            merged[merged.count - 1][1] = max(lastMerged[1], current[1])
        } else {
            // If they don't overlap, add the current interval to the merged list
            merged.append(current)
        }
    }
    return merged
}

// Example usage:
//let intervals = [[1,3], [2,6], [8,10], [9,18]]
//let result = mergeIntervals(intervals)
//print(result)  // Output: [[1, 6], [8, 10], [15, 18]]


//Missing and Repeating in an Array
func missingAndRepeatingElementInArray(_ nums: [Int]){
    //first approch visisted array
    var visitedArr = [Bool](Array(repeating: false, count: nums.count+1))
    for (index,item) in nums.enumerated(){
        if visitedArr[item]{
            print("repeating: \(item)")
        }else{
            visitedArr[item] = true
        }
    }
    for i in 1..<nums.count{
        if !visitedArr[i]{
            print("missing: \(i)")
        }
    }
    //second approch
}
//let nums15 = [1,3,3,4,5]
//let result = missingAndRepeatingElementInArray(nums15)

//
func findMissingAndRepeating(_ arr: [Int]) -> (Int, Int) {
    let n = arr.count
    // Calculate expected sum and sum of squares for numbers 1 to n
    let expectedSum = n * (n + 1) / 2
    let expectedSumOfSquares = n * (n + 1) * (2 * n + 1) / 6

    // Calculate the actual sum and sum of squares from the given array
    var sumOfArray = 0
    var sumOfSquaresOfArray = 0
    for num in arr {
        sumOfArray += num
        sumOfSquaresOfArray += num * num
    }
    // The difference in sums
    let sumDiff = expectedSum - sumOfArray  // (missing - repeating)
    // The difference in sums of squares
    let squareSumDiff = expectedSumOfSquares - sumOfSquaresOfArray  // (missing^2 - repeating^2)
    // Now we can solve the system of equations:
    // missing - repeating = sumDiff
    // missing^2 - repeating^2 = squareSumDiff
    // We use the identity a^2 - b^2 = (a - b)(a + b)
    // So: (missing + repeating) = squareSumDiff / sumDiff
    let sumPlus = squareSumDiff / sumDiff  // (missing + repeating)
    // Now we can calculate missing and repeating
    let missing = (sumPlus + sumDiff) / 2
    let repeating = sumPlus - missing
    return (missing, repeating)
}

// Example Usage:
let arr = [1, 3, 3, 4, 5]
let result = findMissingAndRepeating(arr)
print("Missing number: \(result.0), Repeating number: \(result.1)")
// Output: Missing number: 2, Repeating number: 3

//Maximum Product Subarray |
//L to Right and right to Left and if product becomes zero update it to 1
func maxProductSubArray(_ nums: inout [Int]) -> Int{
    //[3,-1,0,4]
    var currProduct = 1
    var maxProduct = 0
    for i in 0..<nums.count{
        currProduct = currProduct * nums[i]
        maxProduct = max(currProduct,maxProduct)
        if currProduct ==  0{
            currProduct = 1
        }
    }
    
    currProduct = 1
    for i in (0..<nums.count).reversed(){
        currProduct = currProduct * nums[i]
        maxProduct = max(currProduct,maxProduct)
        if currProduct ==  0{
            currProduct = 1
        }
    }
    return maxProduct
}
var numArr = [3,-1,0,4]
print(maxProductSubArray(&numArr))

//"First Missing Positive
func firstMissingPositive(_ nums: inout [Int]) -> Int {
    let n = nums.count
    // Place each number in its correct position if it's in the range [1...n]
    for i in 0..<n {
        while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
            nums.swapAt(i, nums[i] - 1)
        }
    }
    // Find the first index where the value is not i+1
    for i in 0..<n {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    // If all positions are correct, return n + 1
    return n + 1
}

// Example usage:
var numss1 = [3, 4, -1, 1,0]
print(firstMissingPositive(&numss1))  // Output: 2


//form largest number from array of int
func formLargestNumberFromArrray(_ nums: [Int]) -> String {
    let numStrings = nums.map { String($0) }
//    print(numStrings)
    // Sort the numbers based on custom comparator
    let sortedStrings = numStrings.sorted { (a, b) -> Bool in
        return a + b > b + a
    }
//    print(sortedStrings)
    let result = sortedStrings.joined(separator: "")
    // Handle the case where the numbers are all zeros
    return result.first == "0" ? "0" : result
}

// Example usage:
let nums1 = [3, 30, 34, 5, 9]
print(formLargestNumberFromArrray(nums1))

//sliding window..Done
func maxSumOfSubarrayOfSize(arr: [Int], k: Int) -> Int {
    var windowSum = 0
    var maxSum = 0
    // Calculate the sum of the first window
    for i in 0..<k {
        windowSum += arr[i]
    }
    maxSum = windowSum
    // Slide the window, subtract the element going out, and add the new element
    for i in k..<arr.count {
        windowSum += arr[i] - arr[i - k]
        maxSum = max(maxSum, windowSum)
        print(windowSum)
    }
    return maxSum
}

//let arrr = [2, 1, 5, 1, 3, 2]
//[-2, 1, -3, 4, -2, 2, 1, -5, 4]
//let k = 4
//let ress = maxSumOfSubarrayOfSize(arr: arrr, k: k)
//print("max Sum Of Subarray with K:- \(ress)")

func maxWaterProblem(heights: [Int])-> Int{
    var leftIndex: Int  = 0
    var rightIndex = heights.count - 1
    var maxArea = 0
    while (leftIndex < rightIndex){
        let width = rightIndex - leftIndex
        let leftHeight = heights[leftIndex]
        let rightHeight = heights[rightIndex]
        let minHeight = min(leftHeight, rightHeight)
        let area = width * minHeight
        maxArea = max(area, maxArea)
        if (leftHeight <= rightHeight) {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }
    }
    return maxArea
}
//let maxwater = maxWaterProblem(heights: [2,1,5,7,0,9,3])
//print("max water area:\(maxwater)")

//VVIMP
//subarray sum problem
func subarraySumToTarget(_ nums: [Int], _ k: Int) -> Int {
    var cumulativeSum = 0
    var count = 0
    var sumFrequency: [Int: Int] = [0: 1]  // To handle case when cumulativeSum equals k at any index
    for num in nums {
        // Update cumulative sum
        cumulativeSum += num
        let diff = cumulativeSum - k
        // Check if there's a subarray that sums to k
        if let frequency = sumFrequency[diff] {
            count += frequency
        }
        // Update the frequency of the cumulative sum in the hashmap
        sumFrequency[cumulativeSum, default: 0] += 1
//        print(sumFrequency)
    }
    return count
}

// Example Usage:
let nums = [1,2,2,3,4,5,2,3,4,1]
let k = 5
let resultt = subarraySumToTarget(nums, k)
print(resultt)  // Output: 2


func twoSumWithBinarySearchApproch(_ nums: [Int], _ target: Int) -> [Int] {
    nums.sorted()
    var s: Int = 0
    var l:Int = nums.count-1
    while (s<l){
        let middle = nums[s] + nums[l]
        if middle == target{
            return [s,l]
        }
        if middle < target{
            s += 1
        }else{
            l -= 1
        }
    }
    return []
}

print("two sum binary search approch:-\(twoSumWithBinarySearchApproch([4,6,7,8,1], 5))")


// Done
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var frequencyMap = [Int: Int]()
    // Count the frequency of each element
    for num in nums{
        if let value = frequencyMap[num]{
            frequencyMap[num] = value + 1
        }else{
            frequencyMap[num] = 1
        }
    }
    print(frequencyMap)
//    for num in nums {
//        frequencyMap[num, default: 0] += 1
//    }
    // Convert the frequency map to an array of (element, frequency) tuples
    let sortedByFrequency = frequencyMap.sorted { $0.value > $1.value }
    // Extract the top K elements by their frequency
    let result = sortedByFrequency.prefix(k).map { $0.key }
    return result
}

//let numss = [1, 1, 1, 2, 2, 3]
//let k = 2
//print(topKFrequent(numss, k))
