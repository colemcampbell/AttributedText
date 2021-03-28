//
//  File.swift
//  
//
//  Created by Cole Campbell on 3/27/21.
//

import Foundation
import SwiftUI

public struct AttributedSubstring: Equatable {
    
    public let string: String
    public let attributes: [AttributedString.Attribute]
    
    public let font: Font?
    public let foregroundColor: Color?
    public let baselineOffset: CGFloat?
    
    public init(_ string: String, attributes: [AttributedString.Attribute]) {
        self.string = string
        self.attributes = attributes
        
        var font: Font?
        var foregroundColor: Color?
        var baselineOffset: CGFloat?
        
        attributes.forEach { attribute in
            switch attribute {
            case let .font(fontAttribute):
                font = fontAttribute
            case let .foregroundColor(colorAttribute):
                foregroundColor = colorAttribute
            case let .baselineOffset(offsetAttribute):
                baselineOffset = offsetAttribute
            }
        }
        
        self.font = font
        self.foregroundColor = foregroundColor
        self.baselineOffset = baselineOffset
    }
    
    public init(_ string: String, font: Font? = nil, foregroundColor: Color? = nil, baselineOffset: CGFloat? = nil) {
        self.string = string
        
        var attributes = [AttributedString.Attribute]()
        
        if let font = font {
            attributes.append(.font(font))
        }
        
        if let color = foregroundColor {
            attributes.append(.foregroundColor(color))
        }
        
        if let offset = baselineOffset {
            attributes.append(.baselineOffset(offset))
        }
        
        self.attributes = attributes
        self.font = font
        self.foregroundColor = foregroundColor
        self.baselineOffset = baselineOffset
    }
}
