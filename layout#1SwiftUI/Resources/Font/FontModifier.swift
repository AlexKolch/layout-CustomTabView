//
//  FontModifier.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import SwiftUI

struct FontModifier: ViewModifier {
    let font: FontManager
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content.font(.custom(font.rawValue, size: size))
    }
    
}
