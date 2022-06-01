# CircularBuffer-swift

## Introduction

This package provides a circular buffer for receiving a stream of data. 
Unlike normal circular buffers, this buffer has a single pointer. (acts as both a head and a tail) 
This limitation allows efficient sorting and output in insertion order.

![Circular Buffer](https://user-images.githubusercontent.com/7419790/171491330-339dfb5c-a510-4cdb-9163-97fdd5cc6242.jpg)


## Example

Creation
```swift
let circularBuffer = CircularBuffer(size: 5, initValue: 0)
```

Insertion
```swift
circularBuffer.push(1)
circularBuffer.push(2)
circularBuffer.push(3)
circularBuffer.push(4)
circularBuffer.push(5)
```

Get aligned buffer
```swift
circularBuffer.getAligned()
```
