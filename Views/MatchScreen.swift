//
//  MatchScreen.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import SwiftUI

struct MatchScreen: View {
    @StateObject private var vm = MatchViewModel()
    
    var body: some View {
        HStack(spacing: AppTheme.spacing) {
            TeamCard(
                name: Team.home.label,
                score: vm.homeScore,
                isServing: vm.serving == .home,
                onPlus: { vm.addPoint(.home) },
                onMinus: { vm.removePoint(.home) }
            )
            
            //Center Controls
            VStack(spacing: 16){
                Text("Score")
                    .font(.largeTitle.bold())
                
                Button {
                    vm.toggleServe()
                } label: {
                    Text("Cambiar Saque")
                        .font(.title3.weight(.semibold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
                .buttonStyle(.borderedProminent)
                
                Button(role: .destructive){
                    vm.reset()
                } label:{
                    Text("Reset")
                }
                .buttonStyle(.bordered)
            }
            
            TeamCard(
                name: Team.away.label,
                score: vm.awayScore,
                isServing: vm.serving == .away,
                onPlus: { vm.addPoint(.away) },
                onMinus: { vm.removePoint(.away)}
            )
        }
        .padding()
        .scenePadding()
    }
}

#Preview {
    MatchScreen()
        .preferredColorScheme(.dark)
}
