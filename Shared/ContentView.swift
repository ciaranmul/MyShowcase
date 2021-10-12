//
//  ContentView.swift
//  Shared
//
//  Created by Ciarán Mulholland on 07/10/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                FoundationsContentsSection()
            }
            .navigationTitle("Components")
        }
    }
}

struct FoundationsContentsSection: View {
    var body: some View {
        Section {
            NavigationLink {
                MyColorsPreviewView()
            } label: {
                Text("Colors")
            }

            NavigationLink {

            } label: {
                Text("Typography")
            }
        } header: {
            Text("Foundations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
