//
//  HJCircularBuffer.swift
//  
//
//  Created by Hyun-je on 2018. 6. 27..
//

import Foundation



class CircularBuffer<T> {
    
    var buffer:[T]
    var initValue:T
    var indexNow:Int
    
    
    init(size: Int, initValue: T) {
        
        self.initValue = initValue
        self.buffer = Array<T>.init(repeating: initValue, count: size)
        
        indexNow = 0
        
    }
    
    func push(_ element: T) {
        
        buffer[indexNow] = element
        
        indexNow += 1
        
        if indexNow >= buffer.count {
            indexNow = 0
        }
        
    }
    
    func reset() {
        
        let size = self.buffer.count
        
        self.buffer = Array<T>.init(repeating: initValue, count: size)
        indexNow = 0
        
    }
    
    
    func align() {
        
        let size = self.buffer.count
        
        let tempBuffer = self.buffer
        self.buffer = Array<T>.init(repeating: initValue, count: size)
        
        
        var tempIndex = indexNow
        for i in 0..<self.buffer.count {
            
            self.buffer[i] = tempBuffer[tempIndex]
            
            if tempIndex == self.buffer.count-1 {
                tempIndex = 0
            }
            else {
                tempIndex += 1
            }
            
        }
        
    }
    
    
}
