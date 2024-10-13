//: [Previous](@previous)

import Foundation
func knapsackRecursive(_ weights: [Int], _ values: [Int], _ capacity: Int, _ n: Int) -> Int {
    // Base case: no items left or no capacity left
    if n == 0 || capacity == 0 {
        return 0
    }
    // If the weight of the current item is more than the remaining capacity,
    // it cannot be included in the knapsack
    if weights[n - 1] > capacity {
        return knapsackRecursive(weights, values, capacity, n - 1)
    } else {
        // We have two options: include the current item or exclude it
        let includeItem = values[n - 1] + knapsackRecursive(weights, values, capacity - weights[n - 1], n - 1)
        let excludeItem = knapsackRecursive(weights, values, capacity, n - 1)
        
        // Return the maximum of including or excluding the current item
        return max(includeItem, excludeItem)
    }
}

let weights = [2, 3, 4, 5]
let values = [3, 4, 5, 6]
let capacity = 5

let maxValue = knapsackRecursive(weights, values, capacity, weights.count)
print("The maximum value that can be obtained is: \(maxValue)")

func knapsack(weights: [Int], values: [Int], capacity: Int) -> Int {
    let n = weights.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: capacity + 1), count: n + 1)
    print(dp)
    // Build the DP table
    for i in 1...n {
        for w in 0...capacity {
            if weights[i - 1] <= w {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
            } else {
                dp[i][w] = dp[i - 1][w]
            }
        }
    }
    print(dp)
    // The bottom-right corner of the DP table contains the maximum value we can get
    return dp[n][capacity]
}

let maxValue = knapsack(weights: weights, values: values, capacity: capacity)
print("The maximum value that can be obtained is: \(maxValue)")
