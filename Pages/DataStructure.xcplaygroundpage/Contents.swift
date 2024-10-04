//: [Previous](@previous)

import Foundation
//: [Next](@next)
var numbers = [0,0,1,0,0,1,0,0]
print(palindrome("abcdedcba"))
print(dictionaryGroupBy([1,2,5,6,3,2,1,3,2,6,7,4,8,9,5,7,9]))

func palindrome(_ input: String)-> Bool{
    let char  = Array(input)
    var i = 0
    var j = char.count - 1
    while (i<j) {
        if char[i] == char[j]{
            i += 1
            j -= 1
        } else {
            return false
        }
    }
    return true
}

func dictionaryGroupBy(_ numbers: [Int]){
    let dups = Dictionary(grouping: numbers, by: {$0})
    let result = dups.filter({$1.count > 1})
    let keys = result.keys
    print(keys)
}



func isFibNumber(a: Int = 0,b : Int = 1,count: Int = 1,number : Int = 34){
    
    var count : Int = count
    let c = a + b

    if c == number{
        count += 1
        print("found fib number")
        print("index \(count)")
        return
    }else{
        if c > number {
            print("Not found")
            return
        }else {
            count += 1
            isFibNumber(a: b, b: c,count: count)
        }
    }
}


//func swap(arr: inout [Int], i: Int, j: Int){
//    let temp = arr[i]
//    arr[i] = arr[j]
//    arr[j] = temp
//}
func swap<T>(arr: inout [T], i: Int, j: Int) {
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}


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
print("two sum:-\(twoSum([4,6,7,8,1], 5))")
/*
extension Collection {
    func myMap<Transform>(transform:(Element) -> Transform)-> [Transform]{
        var result = [Transform]()
        forEach { element in
            result.append(transform(element))
        }
        return result
    }
    
    func myFilter(isIncluded :(Element) -> Bool)-> [Element]{
        var result = [Element]()
        forEach { element in
            if isIncluded(element) {
                result.append(element)
            }
        }
        return result
    }
}
*/

func longestPalindrome(_ s: String) -> String {
    
    /*If Empty or equal to one we return*/
    if(s.count == 0){return ""}
    if(s.count == 1){return s}
    
    /*Start and End represent the palindrome with the longest length. */
    var start = 0, end = start, stringArray = Array(s), max = 0
    
    for i in 0..<s.count{
        
        /*Left and Right  pointers move inward (Sandwich principle).*/
        var left = i, right = s.count-1, tempStart = left, tempEnd = right
        
        while(left<right){
            /*If values at the Left and Right index are equal then we temporarily store index if greater than max*/
            if(stringArray[left] == stringArray[right]){
                if((right - left) > max){
                    max = (right - left)
                    tempStart = left
                    tempEnd = right
                }
                left+=1
                right-=1
            }
            else{//Reset temp variables and the current max
                left = i
                right = tempEnd - 1
                tempStart = left
                tempEnd = right
                max = 0
            }
        }
        if((tempEnd - tempStart) > (end - start)){//Store temp variables and continue loop
            end = tempEnd
            start = tempStart
        }
    }
    return (String(stringArray[start...end]).count > 1) ? String(stringArray[start...end]) : String(s.first!)
}

func segregate0_1_2_inArray(){
    //    var number = [2,0,1,2,2,1,2,1,0,0,2,2,1,0]
    var number = [0,1,1,1,0,0,1,0]
    var start = 0
    var last = number.count-1
    var mid = start
    while (mid<=last){
        switch number[mid]{
        case 0:
            swap(arr: &number, i: start, j: mid)
            start += 1
            mid += 1
            break
        case 1:
            mid += 1
            break
        case 2:
            swap(arr: &number, i: mid, j: last)
            last -= 1
            break
        default:
            break
        }
    }
    print(number)
}
print("segregate")
segregate0_1_2_inArray()


func repeatingCharInString(){
    let input: String = "geeksforgeeks"
    var dict: [Character:Int] = [:]
    for char in input{
        dict[char] = (dict[char] ?? 0) + 1
    }
    print("-----")
    print(dict)
    print("-----")
    let result = dict.sorted(by: {$0.value > $1.value})
    print(result)
    print("-----")
    print(result.first?.key ?? "")
    //
    let arr = Dictionary(grouping: input, by: {$0})
    let resultt = arr.filter({$1.count > 1})
    let output = resultt.sorted(by: {$0.value.count > $1.value.count}).first
    print(output?.key ?? "")
    print("-----")
}

repeatingCharInString()
@objc protocol OptionalDeclare{
    @objc optional  func returnSum()
}

protocol AddNumber{
    associatedtype T
    func add(_ num1: T,_ num2: T) -> T
    var sum : T { get set}
}

class AddDouble : AddNumber{
    var sum: Double = 0
    typealias T = Double
    func add(_ num1: Double, _ num2: Double) -> Double {
        return num2 + num1
    }
}

class AddString : AddNumber{
    typealias T = String
    var sum: String = ""
    func add(_ num1: String, _ num2: String) -> String {
        return num2 + num1
    }
}

class AddInt : AddNumber{
    typealias T = Int
    var sum: Int = 0
    func add(_ num1: Int, _ num2: Int) -> Int {
        return num2 + num1
    }
}

//MARK:- Opaque type + associatedType
class Output {
    func getResultType() -> some AddNumber {
//        return AddDouble()
        return  AddString()
    }
}


// Add two number..
protocol Addable: Equatable{
    static func +(lhs:Self,rhs:Self)-> Self
}
extension String: Addable{
}
extension Int: Addable{
}
extension Double: Addable{
}

func  add<T: Addable>(first: T, second: T) -> T {
    return first + second
}
func addNumber<T: Numeric>(_ num1: T,_ num2: T)-> T{
    return num1 + num2
}
add(first: 10, second: 20)
print(add(first: "10", second: "20"))


//[1,2,3,4,5,2,1]
func peakOfMountainIndex(_ arr: [Int]){
    var left = 0
    var right = arr.count-1
    while (left < right){
        let mid = (left+right)/2
        if arr[mid] < arr[mid+1]{
            left = mid + 1
        } else{
            right = mid
        }
    }
    print(right)
}

func buyAndSellStock(){
    //[6,6,6,4,4]
    //preprocesing
    //var arr5 = Array(repeating: 0, count: 5)
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

buyAndSellStock()

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
let maxwater = maxWaterProblem(heights: [2,1,5,7,0,9,3])
print("max water area:\(maxwater)")


struct Stack<T> : CustomStringConvertible{
    var description: String{
        return  (items.map({_ in "$0"}).joined(separator: ","))
    }
    
    var items: [T]
    
    mutating func apend(item: T){
        items.insert(item, at: 0)
    }
    
    mutating func pop() -> T?{
        if items.isEmpty{ return nil}
        return items.removeFirst()
    }
    
    func peek() -> T?{
        if items.isEmpty{ return nil}
        return items.first
    }
}

func validExpression() -> Bool{
    let s = "{{{({[]})}}}]"
    var stack = Stack<Character>(items: [])
    for char in s{
        if char == "{" || char == "("  || char == "[" {
            stack.apend(item: char)
        }else{
            if stack.items.isEmpty {
                return false
            }
            if String(stack.peek() ?? Character("")) + String(char) == "{}" || String(stack.peek() ?? Character("")) + String(char) == "()" || String(stack.peek() ?? Character("")) + String(char) == "[]"{
                stack.pop()
            } else {
                return false
            }
        }
    }
    return stack.items.isEmpty
}

//print(validExpression())


struct WillSetDidSet{
    var name: String = "khan"{
        didSet{
            print(name)
        }
        willSet(newName){
            print(name)
            print(newName)
        }
    }
    
//    func deferr(){
//        defer {
//            print("1")
//            defer {
//                print("3")
//                defer {
//                    print("4")
//                }
//            }
//        }
//        defer {
//            print("2")
//        }
//    }
    
}

class Pokemon : NSObject{
    @objc dynamic var name: String
    init(name: String) {
       self.name = name
    }
}
let myFirstPokemon = Pokemon(name: "Charmander")
//:- KVC
let pokemonName = myFirstPokemon.value(forKey: "name")
myFirstPokemon.setValue("Charmeleon", forKey: "name")
//:- KVO
myFirstPokemon.observe(\.name,options: [.old,.new]) { pokemon, value in
    print("old name \(value.oldValue!)")
    print("new name \(value.newValue!)")
}
//myFirstPokemon.name = "Asif"
//myFirstPokemon.name = "Khan"

if let zero = Int("0"){
    print(zero)
}
print(Int("a") as Any)

class Address{
    var city: String
    var street: String
    var country: String
    unowned var user: User?
    init(city: String,street:String,country: String) {
        self.city = city
        self.country = country
        self.street = street
    }
    deinit {
        print("Address removed from memory")
    }
}

class User{
    var name: String
    var address: Address?
    init(name: String){
        self.name = name
    }
    deinit {
        print("User removed from memory")
    }
}
var user: User? = User(name: "asif")
var address: Address? = Address(city: "india", street: "new delhi", country: "pak")
user?.address = address
address?.user = user
user = nil
address = nil

//var user1 = user
//user1.address.city = "kolkata"
//print(user.address.city)
//print(user1.address.city)
//
//user.address.city = "mumbai"
//print(user.address.city)
//print(user1.address.city)

//user.address = address
//address.

//MARK:- Comparable
struct Student: Comparable {
  static func < (lhs: Student, rhs: Student) -> Bool {
      return lhs.secondName < rhs.secondName
  }
  
  var firstName: String
  var secondName: String
  var faculty: String
}
let student1 = Student(firstName: "Mark", secondName: "Williams", faculty: "CIE")
let student2 = Student(firstName: "Lisa", secondName: "Andrews", faculty: "CSE")
let students = [student1, student2]
// < operator sorts secondName in ascending order
let sortedStudents = students.sorted(by: <)


//MARK: - Getter setter willSet DidSet
class Animal{
    lazy var breed: String? = "African"
    // Property observer
    private var _name: String = "Elephant"{
        willSet(newValue){
            print("As you can see the value is still \(self._name)")
        }
        didSet{
            print("As you can see the value is updated \(self._name)")
        }
    }
    // Computed  property
    var name: String?{
        set(newValue){
            _name = newValue ?? ""
        }
        get{
            return _name
        }
    }
}

//var animal = Animal()
//animal.name = "Dog"
//animal.breed = "American"
//animal.name = "Cate"

//buy and sell stocks..
func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
//    var cnt = prices.count
    var maxProfit = 0
    var minPrice = prices[0]
    //    for i in 0..<cnt{
    //        for j in (i+1)..<cnt{
    //            let profit = prices[j] - prices[i]
    //            maxProfit = max(maxProfit, profit)
    //        }
    //    }
    for i in 1..<prices.count {
        // Update the minimum price if the current price is lower
        minPrice = min(minPrice, prices[i])
        // Calculate the profit if we sell on day `i`
        let profit = prices[i] - minPrice
        // Update the maximum profit if this profit is higher
        maxProfit = max(maxProfit, profit)
    }
    return  maxProfit
}

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
//var nums = [1, 2, 3, 4, 5, 6, 7]
//rotate(&nums, 1)
//print(nums)


func kadane(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    var maxSoFar = arr[0]
    var currentMax = arr[0]
    for i in 1..<arr.count {
        currentMax = max(arr[i], currentMax + arr[i])
//        print("currentMax \(currentMax) index \(i)")
        maxSoFar = max(maxSoFar, currentMax)
//        print("maxSoFar \(maxSoFar)  index \(i)")
    }
    return maxSoFar
}

let arr = [-2, 1, -3, 4, -2, 2, 1, -5, 4]
let result = kadane(arr)
print("Maximum subarray sum: \(result)")

//String related questions
func reverseString(str: inout String)-> String{
    if str.isEmpty{ return ""}
    var start:Int = 0
    var last = str.count - 1
    var strArr = Array(str)
    while start < last{
        let startStr = strArr[start]
        let lastStr = strArr[last]
        strArr[last] = startStr
        strArr[start] = lastStr
        start += 1
        last -= 1
    }
    return String(strArr)
}
var inputStr = "abcef"
let reverseOutput = reverseString(str: &inputStr)
print("reverseOutput \(reverseOutput)")

//Sorting..
func sortArr(arr: inout [Int])-> [Int]{
    for i in 0..<arr.count{
        for j in i..<arr.count{
            if arr[i] > arr[j]{
                swap(arr: &arr, i: i, j: j)
            }
        }
    }
    return arr
}


//var inputArr = [-2, 1, -3, 4, -2, 2, 1, -5, 4]
//let output = sortArr(arr: &inputArr)
//print("sortOutput \(output)")

func mergeSort(_ array: inout [Int]) {
    if array.count <= 1 {
        return
    }

    let middleIndex = array.count / 2
    var leftArray = Array(array[0..<middleIndex])
    var rightArray = Array(array[middleIndex..<array.count])

    mergeSort(&leftArray)   // Recursively sort left half
    mergeSort(&rightArray)  // Recursively sort right half
    array = merge(leftArray, rightArray)
    print("mergedArray\(array)")
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var leftIndex = 0
    var rightIndex = 0

    // Merge the two arrays by comparing elements
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }

    // Append any remaining elements from the left array
    while leftIndex < left.count {
        mergedArray.append(left[leftIndex])
        leftIndex += 1
    }

    // Append any remaining elements from the right array
    while rightIndex < right.count {
        mergedArray.append(right[rightIndex])
        rightIndex += 1
    }
    return mergedArray
}

//var input1Arr = [-2, 1, -3, 4, -2, 2, 1, -5, 4]
//mergeSort(&input1Arr)

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

//without repeating characters as we move the window.
func lengthOfLongestSubstring(_ s: String) -> Int {
    var left = 0
    var maxLength = 0
    var charIndexMap = [Character: Int]()
    let characters = Array(s)
    for right in 0..<characters.count {
        let currentChar = characters[right]
        // If the current character is already in the map and is within the current window
        if let lastSeenIndex = charIndexMap[currentChar], lastSeenIndex >= left {
            // Move the left pointer to the right of the last seen position of the current character
            left = lastSeenIndex + 1
        }
        // Update the map with the current character's index
        charIndexMap[currentChar] = right
        print(charIndexMap)
        // Calculate the current window size and update maxLength
        maxLength = max(maxLength, right - left + 1)
    }
    return maxLength
}

//let input = "abcabcbb"
//print(lengthOfLongestSubstring(input))

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


func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var result = [Int]()
    let sArray = Array(s)
    let pArray = Array(p)
    let sLength = sArray.count
    let pLength = pArray.count
    // If p is longer than s, there can't be any anagrams
    if pLength > sLength {
        return result
    }
    // Create frequency count for p
    var pCount = [Int](repeating: 0, count: 26)
    for char in pArray {
        pCount[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
    }
    print(pCount)
    // Create frequency count for the first window in s
    var sCount = [Int](repeating: 0, count: 26)
    for i in 0..<pLength {
        sCount[Int(sArray[i].asciiValue! - Character("a").asciiValue!)] += 1
    }
    print(sCount)
    // Check if the first window matches
    if sCount == pCount {
        result.append(0)
    }
    // Slide the window across s
    for i in pLength..<sLength {
        // Add the next character to the window
        sCount[Int(sArray[i].asciiValue! - Character("a").asciiValue!)] += 1
        // Remove the first character of the previous window
        sCount[Int(sArray[i - pLength].asciiValue! - Character("a").asciiValue!)] -= 1
        // Check if current window matches the frequency count of p
        if sCount == pCount {
            result.append(i - pLength + 1)
        }
    }
    return result
}

// Example usage
let s = "abaebabadcd"
let p = "aba"
print(findAnagrams(s, p))  // Output: [0, 6]

