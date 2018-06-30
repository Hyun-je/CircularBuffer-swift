//
//  HJCircularBuffer.swift
//  
//
//  Created by Hyun-je on 2018. 6. 27..
//

import Foundation



public class HJCircularBuffer<T> {
    
    private var buffer:[T]
    private var initValue:T
    private var indexNow:Int
    
    
    subscript(index:Int) -> T {
        get {
            return buffer[index]
        }
    }
    
    public init(size: Int, initValue: T) {
        
        self.initValue = initValue
        self.buffer = Array<T>.init(repeating: initValue, count: size)
        
        indexNow = 0
        
    }
    
    public func push(_ element: T) {
        
        buffer[indexNow] = element
        
        indexNow += 1
        
        if indexNow >= buffer.count {
            indexNow = 0
        }
        
    }
    
    public func reset() {
        
        let size = self.buffer.count
        
        self.buffer = Array<T>.init(repeating: initValue, count: size)
        indexNow = 0
        
    }
    
    public func getBuffer() -> [T] {
        return buffer
    }
    
    public func align() {
        
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
