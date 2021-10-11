//
//  ContentView.swift
//  Shared
//
//  Created by Ciarán Mulholland on 07/10/2021.
//

import SwiftUI
import MyStyles

struct ContentView: View {
    var body: some View {
        List() {
            ColorPreview("surface", MyColor.surface)
            ColorPreview("background", MyColor.background)
            ColorPreview("contentSuccess", MyColor.contentSuccess)
        }
    }
}

struct ColorPreview: View {
    var text: String
    var color: MyColor

    init(_ text: String, _ color: MyColor) {
        self.text = text
        self.color = color
    }

    var body: some View {
        HStack {
            Text(text)
                .padding()
            Spacer()
        }
        .background(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
