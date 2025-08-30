//
//  TeamCard.swift
//  Score
//
//  Created by Mac on 29/08/25.
//

import SwiftUI

struct TeamCard: View {
    let name: String
    let score: Int
    let isServing: Bool
    let onPlus: () -> Void
    let onMinus: () -> Void
    
    var body: some View {
        VStack(spacing: 16){
            Text(name)
                .font(.title2)
            
            Text("\(score)")
                .font(AppTheme.bigScoreFont)
                .monospacedDigit()
            
            if isServing {
                Text("Serve")
                    .font(.headline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
            }
            
            HStack(spacing: 12){
                Button("-1",action: onMinus)
                    .buttonStyle(.bordered)
                    .font(.title2)
                
                Button("+1", action: onPlus)
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    
            }
        }
        .frame(maxWidth: 360)
        .padding()
        .background(.thinMaterial)
        .cornerRadius(AppTheme.cardCorner)
        .shadow(radius: 8)
    }
}

#Preview {
    TeamCard(
        name: "Local",
        score: 18,
        isServing: true,
        onPlus: {},
        onMinus: {}
    )
    .padding()
    .background(Color.black)
}
