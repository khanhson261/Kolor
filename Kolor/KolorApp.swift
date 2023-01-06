//
//  KolorApp.swift
//  Kolor
//
//  Created by Khanh Son on 1/4/23.
//

import SwiftUI

@main
struct KolorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB())
        }
    }
}
