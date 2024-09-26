//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//var greeting = "Hello, playground"
var numbers = [0,0,1,0,0,1,0,0]
print(greeting)
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

func segregateZeroAnotherMethod(){
    var i = 0 // 0
    var j = numbers.count - 1 // 6
    while (i < j){
        if numbers[i] < numbers[j]{
            swap(arr: &numbers, i: i,j: j)
            i += 1
            j -= 1
        }else if numbers[i] == numbers[j] {
            if numbers[i] == 0{
                j -= 1
            } else{
                i += 1
            }
        } else{
            i += 1
            j -= 1
        }
    }
//    print(numbers)
}

func swap(arr: inout [Int], i: Int, j: Int){
    var temp = numbers[i]
    numbers[i] = numbers[j]
    numbers[j] = temp
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
//func twoSumGood(_ nums: [Int], _ target: Int) -> [Int] {
//    var map = [Int: Int]()
//    for (i, n) in nums.enumerated() {
//        let diff = target - n
//        if let j = map[diff] {
//        return [i, j]
//    }
//    map[n] = i
//    }
//    return []
//}

/*
 diff = target - arr[i]
 contains in map {
 return true
 }
 append in map arr[i]
 
 */

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
    var number = [2,1,2,2,1,2,1,2,0,0,2,1]
    //[2,0,2,2,1]
    //[1,0,2,2,2]
    //[0,1,2,2,2]
    var start = 0
    var last = number.count-1
    var mid = start
    while (mid<=last){
        switch number[mid]{
        case 0:
            var temp = number[start]
            number[start] = number[mid]
            number[mid] = temp
            start += 1
            mid += 1
            break
        case 1:
            mid += 1
            break
        case 2:
            var temp = number[mid]
            number[mid] = number[last]
            number[last] = temp
            last -= 1
            break
        default:
            break
        }
    }
    print(number)
}
//segregate0_1_2_inArray()


func repeatingCharInString(){
    var input: String = "geeksforgeeks"
    var dict: [Character:Int] = [:]
    for char in input{
        dict[char] = (dict[char] ?? 0) + 1
    }
    print("-----")
    print(dict)
    print("-----")
    var result = dict.sorted(by: {$0.value > $1.value})
    print(result)
    print("-----")
    print(result.first?.key ?? "")
    //
    var arr = Dictionary(grouping: input, by: {$0})
    let resultt = arr.filter({$1.count > 1})
    var output = resultt.sorted(by: {$0.value.count > $1.value.count}).first
    print(output?.key ?? "")
    print("-----")
}

repeatingCharInString()
@objc protocol OptionalDeclare{
    @objc optional  func returnSum()
}

protocol AddNumber{
    associatedtype T
    func addTwoNumber(_ num1: T,_ num2: T) -> T
    var sum : T { get set}
}

class AddDouble : AddNumber{
    var sum: Double = 0
    typealias T = Double
    func addTwoNumber(_ num1: Double, _ num2: Double) -> Double {
        return num2 + num1
    }
}

class AddString : AddNumber{
    var sum: String = ""
    typealias T = String
    func addTwoNumber(_ num1: String, _ num2: String) -> String {
        return num2 + num1
    }
}

//MARK:- Opaque type + associatedType
class Output {
    func getResultType() -> some AddNumber{
//        return AddDouble()
        return  AddString()
    }
}

//MARK:- Node
class Node<T: Equatable> {
    var value:T
    var previous : Node?
    var next  : Node?
    init(value: T){
        self.value = value
    }
}

extension Node: Equatable{
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

public class LinkedList<T: Equatable>{
     var head: Node<T>?
    
    var isEmpty: Bool{
        return head == nil
    }
    
    var first: Node<T>?{
        return head
    }
    
    var last: Node<T>?{
        guard var node = head else { return nil}
        while let next = node.next{
            node = next
        }
        return node
    }
    
    public func append(value: T){
        let newNode = Node(value: value)
        if let lastNode = last{
            newNode.previous = lastNode
            lastNode.next = newNode
        }else{
            head = newNode
        }
    }
    
    public func count() -> Int{
        guard var node = head else { return 0}
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func reverseLinkedListSimple() -> Node<T>?{
        var current = head
        var prev: Node<T>? = nil
        var next: Node<T>? = nil
        while (current != nil){
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}

// Add two number..
protocol Addable{
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
        var mid = (left+right)/2
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
    var s = "{{{({[]})}}}]"
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
//2
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

