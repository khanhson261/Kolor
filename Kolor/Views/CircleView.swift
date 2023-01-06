//
//  CircleView.swift
//  Kolor
//
//  Created by Khanh Son on 1/4/23.
//

import SwiftUI

struct  ColorCircle: View {
    var size: CGFloat
    var color: RGB
    var body: some View {
        ZStack {
          Circle()
            .fill(Color.element)
            .northWestShadow()
          Circle()
            .fill(Color(rgbStruct: color))
            .padding(20)
        }
        .frame(width: size, height: size)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
          Color.element
            ColorCircle(size: 200, color: RGB())
        }
        .frame(width: 300, height: 300)
        .previewLayout(.sizeThatFits)
    }
}
