//
//  View + Ext.swift
//  layout#1SwiftUI
//
//  Created by Алексей Колыченков on 21.08.2024.
//

import SwiftUI

extension View {
    func customFont(type: FontManager = .regular, size: CGFloat = 12) -> some View {
        modifier(FontModifier(font: type, size: size))
    }
}
