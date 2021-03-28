//
//  AttributedText.swift
//
//
//  Created by Cole Campbell on 3/27/21.
//

import Foundation
import SwiftUI

public struct AttributedText: View {
    
    public let content: AttributedString
    
    public init(_ content: AttributedString) {
        self.content = content
    }
    
    public var body: some View {
        self.text
    }
    
    private var text: Text? {
        self.content.reduce(Text("")) { text, attributedString in
            text + Text(attributedString.string)
                .font(attributedString.font)
                .baselineOffset(attributedString.baselineOffset ?? 0)
                .foregroundColor(attributedString.foregroundColor)
        }
    }
}

struct AttributedText_Previews: PreviewProvider {
    static var previews: some View {
        AttributedText(self.attributedString)
    }
    
    static var attributedString: AttributedString {
        AttributedString("1",
            attributes: [
                .font(Font.system(size: 12, weight: .bold, design: .default)),
                .baselineOffset(8)
            ]
        ) + AttributedString("/",
            attributes: [
                .font(Font.system(size: 21, weight: .medium, design: .default))
            ]
        ) + AttributedString("x",
            attributes: [
                .font(Font.system(size: 12, weight: .bold, design: .default)),
                .baselineOffset(-2)
            ]
        )
    }
}
