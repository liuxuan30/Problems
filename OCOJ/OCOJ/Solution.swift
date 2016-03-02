//
//  Solution.swift
//  OCOJ
//
//  Created by Xuan on 3/2/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

import Foundation

public class Solution: NSObject
{
    func canWinNim(n: Int) -> Bool {
        // if the remain count is 4x, we can never win.
        // the strategy is we always pick (rest count % 4) stones, so let the opponent face 4x case
        return n % 4 == 0 ? false : true
    }
    
    func addDigits(num: Int) -> Int {
        var number = abs(num)
        
        while number >= 10
        {
            var sum = 0
            var order = Int(log10(Double(number)))
            
            while order >= 0
            {
                let mag = Int(pow(10, Double(order)))
                let currentDigit = number / mag
                sum += currentDigit
                number -= currentDigit * mag
                order -= 1
            }
            number = sum
        }
        
        return number
    }
    
    func addDigitsO1(num: Int) -> Int {
        guard num >= 10 else { return num }
        let q = num % 9
        return q == 0 ? 9 : q
    }
}

public class isPalindromeSolution: Solution {
    func isPalindrome(s: String) -> Bool {
        guard !s.isEmpty else { return true }
        
        let lowerString = s.lowercaseString
        var left = lowerString.startIndex
        var right = lowerString.startIndex.advancedBy(lowerString.characters.count - 1)
        let leftMost = lowerString.startIndex
        let rightMost = lowerString.startIndex.advancedBy(lowerString.characters.count - 1)
        
        while left < right
        {
            while (lowerString[left] < "a" || lowerString[left] > "z") && (lowerString[left] > "9" || lowerString[left] < "0") && left < rightMost
            {
                left = left.advancedBy(1, limit: rightMost)
            }
            
            while (lowerString[right] < "a" || lowerString[right] > "z") && (lowerString[right] > "9" || lowerString[right] < "0") && right > leftMost
            {
                right = right.advancedBy(-1, limit: leftMost)
            }
            
            if left <= right && lowerString[left] != lowerString[right]
            {
                return false
            }
            
            if (right > left)
            {
                left = left.advancedBy(1)
                right = right.advancedBy(-1)
            }
        }
        
        return true
    }
}
