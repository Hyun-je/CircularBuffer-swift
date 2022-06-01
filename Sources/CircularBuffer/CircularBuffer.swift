import Foundation

public class CircularBuffer<Element> {
    
    private var buffer: [Element]
    private var initValue: Element
    private var pushCount: Int
    
    public var size: Int {
        return buffer.count
    }
    
    public var index: Int {
        return pushCount % buffer.count
    }
    
    public var isFilled: Bool {
        return pushCount >= size
    }
    
    subscript(index: Int) -> Element {
        get {
            return buffer[index]
        }
    }
    
    public init(size: Int, initValue: Element) {
        
        assert(size > 0, "Buffer size should not be zero")
        
        self.initValue = initValue
        self.buffer = .init(repeating: initValue, count: size)
        
        pushCount = 0
        
    }
    
    public func push(_ element: Element) {
        
        buffer[index] = element
        pushCount = pushCount + 1
        
    }
    
    public func reset() {
        
        buffer = .init(repeating: initValue, count: size)
        pushCount = 0
        
    }
    
    public func getBuffer() -> [Element] {
        return buffer
    }
    
    public func getAligned() -> [Element] {
        return Array(buffer[index...] + buffer[0..<index])
    }
    
}
