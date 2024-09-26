import UIKit
import Foundation
// Created repo on Github account
var result = [1,2,3,4,5,6]
var nums = [1,2,3,4,5,6]
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty{
        return []
    }
    for i in 0...nums.endIndex-1{
        for j in (i+1)...nums.endIndex-1{
            if nums[j] == target - nums[i]{
                return [i,j]
            }
        }
    }
    return []
}


let sum = nums.reduce(0) { (result, next) in
    return result + next
}
print("====\(sum)====")
extension Collection{
    func mappp<T>(_ transform: (_ Element: T) -> T) -> [T]{
        var result = [T]()
        for element in self{
            result.append(transform(element as! T))
        }
        return result
    }
    
    func filterrr(_ isIncluded: ((Element) -> Bool)) -> [Element]{
        var result = [Element]()
        for element in self{
            if isIncluded(element){
                result.append(element)
            }
        }
        return result
    }
    
    func reduceee<T>(_ initResult: T,_ finalResult: (T,Element)-> T) -> T{
        var result = initResult
        for element in self {
            result = finalResult(result,element)
        }
        return result
    }
}


func deferStatement(){
    //    result.reduce(0) { x, y in
    //        return x + y
    //    }
    print("task1")
    defer {
        print("task2")
        defer {
            print("task3")
        }
    }
    print("task4")
}

func mergeTwoSortedArray(arr1: [Int],arr2: [Int]) -> [Int]{
    if arr1.isEmpty { return arr2}
    if arr2.isEmpty { return arr1}
    var i = 0
    var j = 0
    var finalArr = [Int]()
    while(i<arr1.endIndex && j<arr2.endIndex){
        if arr1[i] < arr2[j]{
            finalArr.append(arr1[i])
            i += 1
        } else{
            finalArr.append(arr2[j])
            j += 1
        }
    }
    
    while (i<arr1.endIndex){
        finalArr.append(arr1[i])
        i += 1
    }
    
    while (j<arr2.endIndex){
        finalArr.append(arr2[j])
        j += 1
    }
    return finalArr
    
}

//func thirdLargestInArray(_ nums: [Int]) -> (Int,Int,Int){
//    var first = 0
//    var second = 0
//    var third = 0
//    for i in 0...nums.count-1{
//        if (nums[i] > first){
//                        third  = second
//                        second = first
//                        first  = nums[i]
//                    }
//                else if (nums[i] > second){
//                        third = second
//                        second = nums[i]
//                    }
//                else if (nums[i] > third){
//                        third = nums[i]
//                }
//    }
//    return (first,second,third)
//}

//print("Third Largest element in given array would be \(thirdLargestInArray([1,3,5,7,9,2,4,6,8,10]))")
//print(mergeTwoSortedArray(arr1: [1,3,5,7,9], arr2: [2,4,6,8,10]))

func removeDuplicates(_ num:  [Int]) -> Int {
    var slow = 0
    var fast = 1
    var nums = num
    if nums.count == 0 || nums.count == 1{
        return nums.count
    }
    
    while (fast<nums.count){
        if nums[slow] != nums[fast]{
            slow += 1
            nums[slow] = nums[fast]
        }
        fast += 1
    }
    return slow + 1
}

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var l = 0
    var r = nums.endIndex-1
    var ans = -1
    while (l<=r){
        let mid = (l + r) / 2
        if nums[mid] == target{
            return mid
        } else if (nums[mid] < target) {
            l = mid + 1
            ans = mid + 1
        } else{
            ans = mid
            r   = mid - 1
        }
    }
    return ans
}

//- Kadane Alogorithm
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var sum = 0
    var maxi  = nums[0]
    for i in 0...nums.count-1{
        sum = sum + nums[i]
        maxi = max(sum, maxi)
        if sum < 0{
            sum = 0
        }
    }
    return maxi
}

func reverseNumber(_ number: inout Int){
    //123
    //
    var result = 0
    while (number>0){
        result = result * 10 + number % 10
        number /= 10
    }
    print(number)
}

print("reverse number:-\(reverseNumber(123305))")

//func sortArray(_ nums: [Int]) -> [Int] {
//    if nums.isEmpty{
//        return nums
//    }
//    var ct0 = 0
//    var ct1 = 0
//    var num = nums
//    for i in 0...nums.endIndex-1{
//        switch(nums[i]){
//        case 0:
//            ct0 += 1
//            break
//        case 1:
//            ct1 += 1
//            break
//        default:
//            break
//        }
//    }
//    var i = 0
//    print(ct0)
//    print(ct1)
//    while (ct0>0){
//        num[i] = 0
//        i += 1
//        ct0 -= 1
//    }
//
//    while (ct1>0){
//        num[i] = 1
//        i += 1
//        ct1 -= 1
//    }
//
//    return num
//}


func lengthOfLastWord(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    let s = Array(s)
    var length =  s.count
    var lastWordLength = 0
    
    //trim
    while length > 0 && s[length - 1] == " " {
        length -= 1
    }
    
    while length > 0 && s[length - 1] != " " {
        lastWordLength += 1
        length -= 1
    }
    
    return lastWordLength
}

func lengthOfLastWordSwift(_ s: String) -> Int {
    if let lastWord = s.components(separatedBy: " ").filter({ $0 != "" }).last {
        return lastWord.count
    } else {
        return 0
    }
}

func groupByFunction(){
    var numbers = [1,2,3,4,5,6,6,6,7,8,8]
    let dups = Dictionary(grouping: numbers, by: { $0 }) //= [3: [3], 7: [7], 1: [1], 4: [4], 8: [8, 8], 6: [6, 6, 6], 5: [5], 2: [2]]
    
    let result = dups.filter({$1.count > 1}) //  = [8: [8, 8], 6: [6, 6, 6]]
    let keys = result.keys  //   = [6,8]
}

//Longest substringl (abbcdd)
//removeFirst - remove element from array to count
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard  s.count > 1 else { return s.count}
    var maxCount = 0
    var currSubstring: [Character] = []
    for char in s{
        if let index =  currSubstring.firstIndex(of: char){
            currSubstring.removeFirst(index + 1)
        }
        currSubstring.append(char)
        maxCount = max(currSubstring.count,maxCount)
    }
    return maxCount
}

//MARK:- try catch throws error handling...
enum UserDetailError: Error{
    case invalidName
    case invalidAge(_ msg: String)
}

func userTest(_ name: String, _ age: Int) throws{
    if name.count == 0 {
        throw UserDetailError.invalidName
    }
    if age > 18 {
        throw UserDetailError.invalidAge("Invalid age")
    }
}

do {
    try userTest("Asif", 19)
} catch let error{
    print("Error \(error)")
}

//let errorType = try? userTest("Asif", 20)
//print(errorType)


func isPalindrome(_ x: Int) -> Bool {
    if x<0{
        return false
    }
    if String(x).count == 1{
        return true
    }
    let str = String(x)
    let aryChar = Array(str)
    var i = 0
    var j = String(x).count - 1
    while(j>i){
        if aryChar[i] != aryChar[j]{
            return false
        }
        i += 1
        j -= 1
    }
    return true
}
//MIMP.
extension Collection{
    
    func myymap<T>(_ transfrom : (Element) -> T) -> [T]{
        var res  = [T]()
        for element in self{
            res.append(transfrom(element))
        }
        return res
    }
    
    func myFilter(_ isIncluded: (Element)-> Bool) -> [Element] {
        var res : [Element] = []
        for element in self {
            if isIncluded(element){
                res.append(element)
            }
        }
        return res
    }
    
    func myReduce<T>(_ initialResult: T, _ nextPartialResult: (T, Element)-> T) -> T {
        var result = initialResult
        for element in self {
            result = nextPartialResult(result, element)
        }
        return result
    }
    
}



//print(isPalindrome(121))
//print([2,4,5,7,9].myMap({ value in
//    return value*value
//}))
//
//print([2,4,5,7,9].myFilter({ value in
//    return value % 2 == 0
//}))
//print([2,4,6,8,10].(0, { sum, element in
//    sum + element
//}))
func reverseNumber(_ num: Int) -> Int {
    var rev = 0
    var nums = num
    while (nums != 0){
        rev = rev * 10 + nums % 10
        nums /= 10
    }
    return rev
}

//print(reverseNumber(1234))


final class SingletonClass{
    static let shared = SingletonClass()
    private init(){
        
    }
}


//MARK:- Linked List

public class Node<T: Equatable>{
    var value: T
    var next: Node?
    var previous : Node?
    
    public init(value: T){
        self.value = value
    }
}

extension Node: Equatable{
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

public class LinkedList<T: Equatable>{
    public var head: Node<T>?
    
    public var isEmpty: Bool {
        return head ==  nil
    }
    
    public var first : Node<T>?{
        return head
    }
    
    public var last: Node<T>?{
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
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
    
    public var printList: String{
        var s = ""
        var node = head
        while node != nil{
            s += "\(node!.value)"
            node = node?.next
            if node != nil {
                s += "->"
            }
        }
        return s + ""
    }
    
    public func getNodeAt(atIndex index: Int) -> Node<T>{
        if index == 0 {
            return head!
        }
        var node = head
        var count = 0
        while node != nil{
            node = node?.next
            if node != nil {
                count += 1
                if count == index{
                    return node!
                }
            }
        }
        return node!
    }
    
    public func insertNodeAt(value: T,atIndex index: Int){
        let newNode = Node(value: value)
        //Insert as a head
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else{
            let prevNode = self.getNodeAt(atIndex: index - 1)
            let nextNode = prevNode.next
            newNode.previous = prevNode
            newNode.next = nextNode
            prevNode.next = newNode
            nextNode?.previous = newNode
        }
    }
    
    public func remove(node: Node<T>) -> T{
        //1->2->3->4->nil
        let previousNode = node.previous
        let nextNode     = node.next
        
        if let previousNode = previousNode{
            previousNode.next = nextNode
        }else{
            head = nextNode
        }
        
        nextNode?.previous = previousNode
        node.previous = nil
        node.next = node
        return node.value
    }
    
    public func removeAt(atIndex index : Int) -> T {
        let nodeToRemove = self.getNodeAt(atIndex: index)
        return remove(node: nodeToRemove)
    }
    
    //INterView Question
    public func getMiddleNode()-> T{
        let middle = self.count() / 2
        return self.getNodeAt(atIndex: middle).value
    }
    
    public func getMiddleNodeEfficient()-> Node<T>{
        var slowNode = head
        var fastNode = head
        
        while (slowNode != nil && fastNode != nil){
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        return slowNode!
    }
    
    func reverseLinkedListSimple() -> Node<T>{
        var current = head
        var prev: Node<T>? = nil
        var next: Node<T>? = nil
        while (current != nil){
            print(current?.value ?? T.self)
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
        return head!
    }
    
    public func reverseListPair() -> Node<T>?{
        //1->2->3->4
        var current = head
        var temp : Node<T>? = head
        while (current != nil && current?.next != nil){
            //swap the pair
            temp?.value = current!.value
            current?.value = current!.next!.value
            current?.next?.value = temp!.value
            //Advance the current pointer by 2 nodes
            current = current?.next?.next  ?? nil
        }
        return head
    }
}
//VVIMP
public func sortTwoSortedList(list1: LinkedList<Int>,list2:LinkedList<Int>) -> Node<Int>?{
    var head1 = list1.head
    var head2 = list2.head
    var newHead : Node<Int>? = nil
    var sorted  : Node<Int>? = nil
    if list1.isEmpty {return head2}
    if list2.isEmpty {return head1}
    
    if (head1 != nil && head2 != nil){
        if (head1?.value ?? 0 <= head2?.value ?? 0) {
            sorted = head1
            head1 = sorted?.next
        }else{
            sorted = head2
            head2 = sorted?.next
        }
    }
    newHead = sorted
    while (head1 != nil && head2 != nil){
        if (head1?.value ?? 0 <= head2?.value ?? 0) {
            sorted?.next = head1
            sorted = head1
            head1 = sorted?.next
        }else{
            sorted?.next = head2
            sorted = head2
            head2 = sorted?.next
        }
    }
    if head1 ==  nil { sorted?.next = head2 }
    if head2 ==  nil { sorted?.next = head1 }
    return newHead
}
//VIMP
public func removeDuplicateFromSortedList(list: LinkedList<Int>) -> Node<Int>?{
    var p = list.head
    var q : Node<Int>? = nil
    while (p != nil && p?.next != nil){
        if (p?.value ?? 0 == p?.next?.value ?? 0){
            q = p?.next?.next
            if q == nil {
                p?.next = nil
                break
            }
            p?.next = q
        }
        if (p?.value ?? 0 != p?.next?.value ?? 0){
            p = p?.next
        }
    }
    return list.head
}

public func detectLoopInLinkedList(list: LinkedList<Int>) -> Bool{
    var p = list.head
    var q = list.head
    while( p != nil && q != nil && q?.next != nil){
        p = p?.next
        q = q?.next?.next
        if p == q {
            return true
            // return pivotNode
        }
    }
    return false
}

public func startingNodeOfLoop(pivotNode: Node<Int>,head1: Node<Int>) -> Node<Int>?{
    var q = head1
    var p = pivotNode
    while (p != q){
        p = (p.next)!
        q = (q.next!)
    }
    return p
}

var list = LinkedList<Int>()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.insertNodeAt(value: 4, atIndex: 3)
list.insertNodeAt(value: 5, atIndex: 4)
list.insertNodeAt(value: 6, atIndex: 5)

var list1 = LinkedList<Int>()
list1.append(value: 6)
list1.append(value: 7)
list1.append(value: 8)
list1.insertNodeAt(value: 9, atIndex: 3)
list1.insertNodeAt(value: 11, atIndex: 4)

print(list.printList)
print(list.reverseLinkedListSimple())
print(list.printList)
//
//print(list.head?.value as Any)
//
//print(list.last?.value as Any)
//
//print(list.count())
//
//print(list.getNodeAt(atIndex: 2).value)
//
//print(list.getMiddleNode())
//print(list.getMiddleNodeEfficient().value as Any)

//print(list.removeAt(atIndex: 2))
//print(list.printList)

//print(list.removeAt(atIndex: list.count() / 2))
//print(list.printList)

//print(list.removeDuplicates())
//print(list.printList)
//print(list.printList)
//list.head = list.reverseList(head: list.head!)
//print(list.printList)
//var sortedList = LinkedList<Int>()
//sortedList.head = sortTwoSortedList(list1: list, list2: list1)
//print(sortedList.printList)
//list.head = removeDuplicateFromSortedList(list: list)
//print(list.printList)

//    print(detectLoopInLinkedList(list: list))
print(deferStatement())

//https://www.avanderlee.com/swift/combine/
//https://www.avanderlee.com/swift/combine/
private func getIndexArrOptimized(){
    var target = 5
    var arr = [Int]()
    for i in 0...nums.count-1{
        let dif = target - nums[i]
        if arr.contains(dif){
            print("found")
        } else{
            arr.append(nums[i])
        }
    }
}

struct stack<T> : CustomStringConvertible{
    var description: String{
        return  (items.map({_ in "$0"}).joined(separator: ","))
    }
    
    var items: [T]
    
    mutating func apend(item: T){
        items.insert(item, at: 0)
    }
    
    @discardableResult
    mutating func pop() -> T?{
        if items.isEmpty{ return nil}
        return items.removeFirst()
    }
    
    @discardableResult
    mutating func peek() -> T?{
        if items.isEmpty{ return nil}
        return items.last
    }
}


extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}


var arrr = [4,5,0,1,5,2,7,2,0,8]
var string = "geeks for geeks"
var stringg = Array(string)
print(arrr.removeDuplicates())
print(stringg.removeDuplicates())
print(stringg)
let results = string.components(separatedBy: " ").map { stringg in
    return String(stringg.reversed())
}
var set = Set(arrr)
var orderedSet = NSOrderedSet(array: arrr)
print(results)
print(set)
print(orderedSet)

//    var s = """
//    var arr = Array(s)
//    var result = Dictionary(grouping: arr, by: {$0}).sorted(by: {$0.value.count > $1.value.count}).first?.value.count ?? 0
//    let finalResult = arr.count - result
//    print(finalResult)
//removeLetter()

class ParentClass{
    func abstractFun() {
        print("This method must be overridden")
    }
}

class SubClass : ParentClass {
    override func abstractFun() {
        // Override
    }
}
//
struct User{}
protocol Loadable {
    associatedtype Model
    func load(from url: URL) async throws -> Model
}

class UserLoader: Loadable {
    typealias Model = User
    func load(from url: URL) async throws -> User {
        return User()
    }
}

//
protocol Weapon {
    var name: String { get }
    var canFire: Bool { get }
    var canCut: Bool { get }
}

protocol Fireable {
    var magazineSize: Int { get }
}
protocol Cuttable {
    var weight: Double { get }
    var steel: String { get }
}

struct LongSword: Weapon, Cuttable {
    let name: String
    let steel: String
    let weight = 7.2
    let canFire = false
    let canCut = true
}

// longsword is a weapon with ability to cut.
struct AK47: Weapon, Fireable {
    let name = "AK47"
    let magazineSize = 30
    let canFire = true
    let canCut = false
}


// ak47 is also a weapon with ability to fire bullets.

//===Required init
class A{
    var a :Int = 10
    required init(){
        print("I am in class A")
    }
}

class B: A {
    required init(){
        print("I am in class B")
    }
}
var objRef:B = B()

class AA{
    var a :Int = 10
    required init(_ msg: String){
        print("I am in class AA \(msg)")
    }
}

class BB: AA {
    required init(_ msg: String){
        print("I am in class BB")
        super.init(msg)
    }
}
var objReff:BB = BB("Testing")
// failable init

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//== copy on write
struct Employeee{
    var name: String
    var address: String
}

var employee1 = Employeee(name: "Mohit", address: "Delhi")
var employee2 = employee1
//print(Unmanaged.passUnretained(employee1).toOpaque())
//print(Unmanaged.passUnretained(employee2).toOpaque())
//== Associated type and typealias
protocol Container: AnyObject{
    associatedtype Item: Equatable
    //    mutating func append(_ item: Item)
    var count: Int { get set}
    subscript(i: Int) -> Item {get}
}
//=-=-=-=
protocol Address {
    associatedtype ZipCode
    var country: String { get set }
    func someState()-> ZipCode
    var zipCode: ZipCode { get set }
}


struct USAddress: Address {
    typealias ZipCode = Int
    var zipCode: ZipCode = 95014
    var country: String = "us"
    func someState() -> Int {
        return 1000
    }
}

struct CanadaAddress: Address {
    typealias ZipCode = String
    var zipCode: ZipCode = "M5V 3L9"
    var country: String = "canada"
    func someState() -> String {
        return "1000"
    }
}


func getUSAddress(_ countryCode: String) -> some Address {
    return USAddress()
}

getUSAddress("+971")


class TestingAssociatedType{
    weak var delegate: (any Container)?
    typealias Item = [String]
    func doDelegateCall(){
        self.delegate?.count = 100
    }
}
