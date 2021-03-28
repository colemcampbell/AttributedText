//
//  AttributedString.swift
//  
//
//  Created by Cole Campbell on 3/27/21.
//

import Foundation
import SwiftUI

public struct AttributedString {
    
    public var string: String {
        self.substrings.reduce(into: "") { $0 += $1.string }
    }
    
    private var substrings: [AttributedSubstring]
    
    public init(_ string: String, attributes: [Attribute]) {
        self.substrings = [AttributedSubstring(string, attributes: attributes)]
    }
    
    public init(_ string: String, font: Font? = nil, foregroundColor: Color? = nil, baselineOffset: CGFloat? = nil) {
        self.substrings = [AttributedSubstring(string, font: font, foregroundColor: foregroundColor, baselineOffset: baselineOffset)]
    }
}

// MARK: - BidirectionalCollection

extension AttributedString: BidirectionalCollection {
    public var startIndex: Int {
        self.substrings.startIndex
    }
    
    public var endIndex: Int {
        self.substrings.endIndex
    }
    
    public func index(after i: Int) -> Int {
        self.substrings.index(after: i)
    }
    
    public func index(before i: Int) -> Int {
        self.substrings.index(before: i)
    }
    
    public subscript(index: Int) -> AttributedSubstring {
        self.substrings[index]
    }
}

// MARK: - RangeReplaceableCollection

extension AttributedString: RangeReplaceableCollection {
    public init() {
        self.substrings = []
    }
    
    public mutating func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where C: Collection, Self.Element == C.Element {
        self.substrings.replaceSubrange(subrange, with: newElements)
    }
}

extension AttributedString {
    public mutating func append(_ other: AttributedString) {
        self.append(contentsOf: other)
    }
    
    public mutating func insert(_ other: AttributedString, at i: Int) {
        self.insert(contentsOf: other, at: i)
    }
}

// MARK: - Equatable

extension AttributedString: Equatable {}

// MARK: - Attribute

extension AttributedString {
    public enum Attribute: Equatable {
        case font(Font)
        case foregroundColor(Color)
        case baselineOffset(CGFloat)
    }
}
