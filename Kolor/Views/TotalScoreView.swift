//
//  TotalScoreView.swift
//  Kolor
//
//  Created by Khanh Son on 1/4/23.
//
import SwiftUI

struct TotalScoreView: View {
    @State private var willMoveToNextScreen = false
    var round: Int
    var score: Int
    let circleSize: CGFloat = 0.88
    let buttonHeight: CGFloat = 0.06
    let buttonWidth: CGFloat = 0.87
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                Color.element
                    .ignoresSafeArea()
                VStack{
                    Text("YOUR TOTAL SCORES IS \(score)")
                        .multilineTextAlignment(.center)
                        .font(
                            .largeTitle
                            .weight(.heavy)
                        )
                        .frame(width: proxy.size.width*circleSize, height: proxy.size.height*circleSize)

                    Button("Play agan") {
                        willMoveToNextScreen.toggle()
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width*buttonWidth, height: proxy.size.height*buttonHeight))
                }
            }
            .navigate(to: ContentView(guess: RGB()), when: $willMoveToNextScreen)
        }
    }
}
