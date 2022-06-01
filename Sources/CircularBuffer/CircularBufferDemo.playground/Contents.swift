import CircularBuffer

let circularBuffer = CircularBuffer(size: 5, initValue: 0)

circularBuffer.push(1)
circularBuffer.push(2)
circularBuffer.push(3)
circularBuffer.push(4)
circularBuffer.push(5)

print(circularBuffer.getBuffer())

circularBuffer.push(6)
circularBuffer.push(7)

print(circularBuffer.getBuffer())

print(circularBuffer.getAligned())
