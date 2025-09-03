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
        GeometryReader { geo in
            VStack(spacing: 16) {
                Text(name)
                    .font(.title2)
                
                Text("\(score)")
                    .font(.system(
                        size: geo.size.width * 0.75, // porcentaje del ancho
                        weight: .bold,
                        design: .rounded
                    ))
                    .minimumScaleFactor(0.3) // se reduce si no cabe
                    .lineLimit(1)
                    .monospacedDigit()
                    .frame(maxHeight: geo.size.height * 0.75) // proporcional al alto
                    .layoutPriority(1)
                
                if isServing {
                    Text("Serve")
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                }
                
                HStack(spacing: 20) {
                    Button("-1", action: onMinus)
                        .buttonStyle(.bordered)
                        .font(.title)
                        .frame(width: geo.size.width * 0.25,
                               height: geo.size.width * 0.25)
                    
                    Button("+1", action: onPlus)
                        .buttonStyle(.borderedProminent)
                        .font(.title)
                        .frame(width: geo.size.width * 0.25,
                               height: geo.size.width * 0.25)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.thinMaterial)
            .cornerRadius(AppTheme.cardCorner)
            .shadow(radius: 8)
        }
        .frame(maxWidth: 400, maxHeight: 600) // tamaño máximo del card
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
