//
//  ViewExtension.swift
//  Kolor
//
//  Created by Khanh Son on 1/4/23.
//

import SwiftUI

extension View {
    func northWestShadow(radius: CGFloat = 16,offset: CGFloat = 6) -> some View {
        return self
            .shadow(color: .highlight, radius: radius, x: -offset, y: -offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }
    func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
    return self
          .shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
          .shadow(color: .highlight, radius: radius, x: offset, y: offset)
    }
}
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
