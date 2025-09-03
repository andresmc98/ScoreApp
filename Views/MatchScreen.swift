//
//  MatchScreen.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import SwiftUI

struct MatchScreen: View {
    @StateObject private var vm = MatchViewModel()
    @State private var showReset = false
    
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
            VStack(spacing: 20){
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
                    showReset = true
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
        .alert("¿Reiniciar Score?", isPresented: $showReset){
            Button("Cancelar", role: .cancel) { }
            Button("Reset", role: .destructive){
                vm.reset()
            }
        }
    }
}

#Preview {
    MatchScreen()
        .preferredColorScheme(.dark)
}
