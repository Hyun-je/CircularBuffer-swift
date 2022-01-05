//
//  HJCircularBuffer.swift
//  
//
//  Created by Hyun-je on 2018. 6. 27..
//

import Foundation

public class HJCircularBuffer<Element> {
    
    private var buffer: [Element]
    private var initValue: Element
    private var indexNow: Int
    
    
    subscript(index:Int) -> Element {
        get {
            return buffer[index]
        }
    }
    
    public init(size: Int, initValue: Element) {
        
        self.initValue = initValue
        self.buffer = .init(repeating: initValue, count: size)
        
        indexNow = 0
        
    }
    
    public func push(_ element: Element) {
        
        buffer[indexNow] = element
        
        indexNow = (indexNow + 1) % buffer.count
        
    }
    
    public func reset() {
        
        let size = buffer.count
        
        buffer = .init(repeating: initValue, count: size)
        indexNow = 0
        
    }
    
    public func getBuffer() -> [Element] {
        return buffer
    }
    
    public func getAligned() -> [Element] {
        return Array(buffer[indexNow...] + buffer[0..<indexNow])
    }
    
}
