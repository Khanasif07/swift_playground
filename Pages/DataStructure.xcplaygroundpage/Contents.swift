//: [Previous](@previous)

import Foundation
//: [Next](@next)
//


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

func repeatingCharInString(){
    let input: String = "geeksforgeeks"
    var dict: [Character:Int] = [:]
    for char in input{
        dict[char, default: 0] += 1
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
print("peakOfMountainIndex\(peakOfMountainIndex([1,2,3,4,5,2,1]))")
//Trapping Rain Water Problem



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
        } else if left[leftIndex] > right[rightIndex] {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }else{
            mergedArray.append(right[rightIndex])
            rightIndex += 1
            leftIndex += 1
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

var input1Arr = [-2, 1, -3, 4, -2, 2, 1, -5, 4]
print("mergeSort: \(mergeSort(&input1Arr))")


//Binary search-> sorted array
func binarySearch<T: Comparable>(array: [T], target: T) -> Int? {
    var leftIndex = 0
    var rightIndex = array.count - 1
    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex) / 2
        let midValue = array[midIndex]
        print("midValue\(midValue)")
        if midValue == target {
            return midIndex  // Target found
        } else if midValue < target {
            leftIndex = midIndex + 1  // Search in the right half
        } else {
            rightIndex = midIndex - 1  // Search in the left half
        }
    }
    return nil  // Target not found
}

let sortedArray = [1, 3, 5, 7, 9, 11, 13, 15, 17]
let index = binarySearch(array: sortedArray, target: 11)
print("binarySearch\(index)")


func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    }
    return n * factorial(n - 1)
}

func fibonacci(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

