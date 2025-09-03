//
//  MatchViewModel.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import Foundation

final class MatchViewModel: ObservableObject {
    @Published var homeScore: Int = 0
    @Published var awayScore: Int = 0
    @Published var serving: Team = .home
    
    private let maxScore: Int = 99
    
    func addPoint(_ team: Team){
        switch team {
        case .home:
            if homeScore < maxScore{
                homeScore += 1
            }
        case .away:
            if awayScore < maxScore {
                awayScore += 1
            }
        }
    }
    
    func removePoint(_ team: Team){
        switch team {
        case .home: if homeScore > 0 {homeScore -= 1}
        case .away: if awayScore > 0 {awayScore -= 1}
        }
    }
    
    func toggleServe(){
        serving = (serving == .home) ? .away : .home
    }
    
    func reset(){
        homeScore = 0
        awayScore = 0
        serving = .home
    }
}
