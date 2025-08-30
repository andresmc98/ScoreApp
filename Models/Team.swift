//
//  Team.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import Foundation

enum Team {
    case home
    case away
}

extension Team {
    var label: String{
        switch self{
        case .home: return "Local"
        case .away: return "Visitante"
        }
    }
}
