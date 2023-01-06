//
//  ContentView.swift
//  Kolor
//
//  Created by Khanh Son on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var willMoveToNextScreen = false
    @State var showScore = false
    @State var game = Game()
    @State var guess: RGB
    let circleSize: CGFloat = 0.28
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    var target = RGB.random()
  var body: some View {
      GeometryReader { proxy in
          ZStack {
             Color.element
            .edgesIgnoringSafeArea(.all)
              VStack {
                  ColorCircle(size: proxy.size.height*circleSize, color: game.target)
                  if !showScore {
                      BevelText(
                        text: "R: ??? G: ??? B: ???", width: proxy.size.width*labelWidth, height: proxy.size.height*labelHeight)
                  } else {
                      BevelText(
                        text: game.target.intString(), width: proxy.size.width*labelWidth, height: proxy.size.height*labelHeight)
                  }
                  ColorCircle(size: proxy.size.height*circleSize, color: guess)
                  BevelText(
                    text: guess.intString(), width: proxy.size.width*labelWidth, height: proxy.size.height*labelHeight)
                      
                  SliderView(colors: $guess.red,colorTracker: .red)
                  SliderView(colors: $guess.green,colorTracker: .green)
                  SliderView(colors: $guess.blue,colorTracker: .blue)
                  Button("Hit me") {
                      showScore = !showScore
                      game.check(guess: guess)
                  }.font(.headline)
                  .buttonStyle(NeuButtonStyle(width: proxy.size.width*buttonWidth, height: proxy.size.height*labelHeight))
                  .alert(isPresented: $showScore) {
                     Alert(
                        title: Text("Your score in this round is:"),
                        message: Text(String(game.scoreRound)),
                        primaryButton: .default(Text("Next Round")) {
                            game.startNewRound()
                            guess = RGB()
                      },
                        secondaryButton: .default(Text("Stop Playing")) {
                            willMoveToNextScreen.toggle()
                        }
                      )
                    
                  }
                  .font(.title)
              }
          }
          .navigate(to: TotalScoreView(round: self.game.round,score: self.game.scoreTotal), when: $willMoveToNextScreen)
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      Group {
          ContentView(guess: RGB())
              .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
              .previewDisplayName("iPhone 14")
          ContentView(guess: RGB())
              .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
              .previewDisplayName("iPhone 14 Pro Max")
          ContentView(guess: RGB())
              .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
              .previewDisplayName("iPhone 8")
      }
  }
}

struct SliderView: View {
    @Binding var colors: Double
    var colorTracker: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $colors)
                .tint(colorTracker)
            Text("255")
        }
        .padding(.horizontal)
        .font(.subheadline)
    }
}


