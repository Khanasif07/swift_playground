//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//MARK:- Main Thread
DispatchQueue.main.async {
    print ("is main thread on serial queue", Thread.isMainThread)
}
//
//MARK:- Concurrent Queue
DispatchQueue.global().async {
    print ("is main thread on concurrent queue", Thread.isMainThread)
}

//MARK:- Private queue
// let privateQueue = DispatchQueue(label: String, gos: DispatchQos, attributes: DispatchQueue.Attributes, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency,
// target: DispatchQueue?)


//MARK:- DispatchQueue + global(PreDefined concurrent) + sync/async
func dispatchQueueGlobal(){
    print("first statement")
    DispatchQueue.global().sync {
        print("syncronus task")
    }
    print("next statement")
    DispatchQueue.global().async {
        print("asyncronus task")
    }
    print("last statement")
}

//MARK:- sync  + serial     = Order(eot)
//MARK:- async + serial     = Order
//MARK:- sync  + concurrent = Order
//MARK:- async + concurrent = Unorder
func dispatchQueueSerialSync(){
    //InitiallyActive
    let serialQueue = DispatchQueue(label: "serial queue",attributes: .concurrent)
    serialQueue.activate()
    print("Start")
    serialQueue.async {
        print ("Task-1 started")
        for i in 0...5 {
            print("Task-1 🇮🇳 \(i)")
        }
        print ("Task-1 completed")
    }
    serialQueue.async {
        print ("Task-2 started")
        for i in 0...5 {
            print("Task-2 🇬🇧 \(i)")
        }
        print ("Task-2 completed")
    }
    print("End")
}

func dispatchGroup(){
    var group = DispatchGroup()
    let serialQueue1 = DispatchQueue(label: "serial queue1",attributes: .concurrent)
    let serialQueue2 = DispatchQueue(label: "serial queue2",attributes: .concurrent)
    
    //    group.enter()
    serialQueue1.async(group: group) {
        print ("Task-1 started")
        for _ in 0...5 {
            print("Task-1 🇮🇳")
        }
        print ("Task-1 completed")
        //        group.leave()
    }
    //    group.enter()
    serialQueue2.async(group: group) {
        print ("Task-2 started")
        for _ in 0...5 {
            print("Task-2 🇬🇧")
        }
        print ("Task-2 completed")
        //        group.leave()
    }
    
    group.notify(queue: DispatchQueue.main) {
        print ("Completed")
    }
}


func dispatchWorkItem(){
    let workItem = DispatchWorkItem {
        for i in 0...3 {
            print (i)
        }
    }
    DispatchQueue.global().async {
        workItem.perform()
    }
    workItem.cancel()
}



func qos(){
    let queue1 = DispatchQueue (label: "com.test.qos", qos: .background)
    let queue2 = DispatchQueue (label: "com.test.qos", qos: .userInteractive)
    queue1.async {
        for _ in 0...3 {
            print("@")
        }
    }
    queue2.async {
        for _ in 0...3 {
            print("$")
        }
    }
}

//dispatchWorkItem()
//dispatchGroup()
//dispatchQueueGlobal()
//dispatchQueueSerialSync()
//qos()

func doLongAsyncTaskInSerialQueue() {
    print("doLongAsyncTaskInSerialQueue")
    print("=-=-=-=")
   let serialQueue = DispatchQueue(label: "com.queue.Serial")
      for i in 1...5 {
        serialQueue.async {

            if Thread.isMainThread{
                print("task running in main thread")
            }else{
                print("task running in background thread")
            }
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) completed downloading")
        }
    }
}

func doLongSyncTaskInSerialQueue() {
    print("doLongSyncTaskInSerialQueue")
    print("=-=-=-=")
    let serialQueue = DispatchQueue(label: "com.queue.Serial")
    for i in 1...5 {
        serialQueue.sync {
            if Thread.isMainThread{
                print("task running in main thread")
            }else{
                print("task running in background thread")
            }
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) completed downloading")
        }
    }
}

func doLongASyncTaskInConcurrentQueue() {
    print("doLongASyncTaskInConcurrentQueue")
    print("=-=-=-=")
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    for i in 1...5 {
        concurrentQueue.async {
            if Thread.isMainThread{
                print("task running in main thread")
            }else{
                print("task running in background thread")
            }
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) completed downloading")
        }
        print("\(i) executing")
    }
}

func doLongSyncTaskInConcurrentQueue() {
    print("doLongSyncTaskInConcurrentQueue")
    print("=-=-=-=")
  let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    for i in 1...5 {
        concurrentQueue.sync {
            if Thread.isMainThread{
                print("task running in main thread")
            }else{
                print("task running in background thread")
            }
            let imgURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imgURL)
            print("\(i) completed downloading")
        }
        print("\(i) executed")
    }
}

doLongAsyncTaskInSerialQueue()
//doLongSyncTaskInSerialQueue()
//doLongASyncTaskInConcurrentQueue()
//doLongSyncTaskInConcurrentQueue()
