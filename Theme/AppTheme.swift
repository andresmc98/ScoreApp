//
//  AppTheme.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import SwiftUI

enum AppTheme {
    static let spacing: CGFloat = 48
    static let cardCorner: CGFloat = 24
    
    static var bigScoreFont: Font {
        .system(size: 120, weight: .bold, design: .rounded)
    }
}
