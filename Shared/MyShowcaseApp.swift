//
//  MyShowcaseApp.swift
//  Shared
//
//  Created by Ciarán Mulholland on 07/10/2021.
//

import SwiftUI
import MyStyles

@main
struct MyShowcaseApp: App {

    init() {
        MyStyles.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.theme, Theme.legacy)
        }
    }
}
