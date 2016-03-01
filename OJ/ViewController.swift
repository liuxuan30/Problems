//
//  ViewController.swift
//  OJ
//
//  Created by Xuan on 3/1/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

import UIKit

class Solution {
    func isPalindrome(s: String) -> Bool {
        let whitespace = NSCharacterSet(charactersInString: ", :.?/\\=+-_)(&^%$#@!<>?\"';`~")
        let strArray = s.lowercaseString.componentsSeparatedByCharactersInSet(whitespace)
        
        var filtedString = ""
        for stringElement in strArray
        {
            filtedString += stringElement
        }
        
        let NSStr = NSString(string: filtedString)
        let length = NSStr.length
        if length < 1
        {
            return true
        }
        else
        {
            for (var i = 0; i <= (length - 1) / 2; i++)
            {
                if NSStr.characterAtIndex(i) != NSStr.characterAtIndex(length - 1 - i)
                {
                    return false
                }
            }
            return true
        }
    }
    
    func isPalindrome2(s: String) -> Bool {
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
            
            if (left > right)
            {
                return true
            }
            
            if lowerString[left] != lowerString[right]
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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let solution = Solution()
        let str = "`l;`` 1o1 ??;l`"
        print(solution.isPalindrome2(str))
    }

}

