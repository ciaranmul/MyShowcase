//
//  MyColorsPreviewView.swift
//  MyShowcase
//
//  Created by Ciarán Mulholland on 11/10/2021.
//

import SwiftUI
import MyStyles

struct MyColorsPreviewView: View {
    @Environment(\.themeEngine) internal var themeEngine
    @State private var showThemeActionSheet = false

    var categories: [ColorCategory] = [
        ColorCategory(name: "Surfaces", colorDetails: [
            ColorDetails(name: "surface", colorToken: .surface),
            ColorDetails(name: "background", colorToken: .background)
        ]),
        ColorCategory(name: "Surfaces (Inverse)", colorDetails: [
            ColorDetails(name: "surfaceInverse", colorToken: .surfaceInverse),
            ColorDetails(name: "backgroundInverse", colorToken: .backgroundInverse)
        ]),
        ColorCategory(name: "Content", colorDetails: [
            ColorDetails(name: "content", colorToken: .content),
            ColorDetails(name: "contentSubtle", colorToken: .contentSubtle),
            ColorDetails(name: "contentDisabled", colorToken: .contentDisabled),
            ColorDetails(name: "contentSuccess", colorToken: .contentSuccess),
            ColorDetails(name: "contentCritical", colorToken: .contentCritical),
            ColorDetails(name: "border", colorToken: .border),
            ColorDetails(name: "divider", colorToken: .divider)
        ]),
        ColorCategory(name: "Content (Inverse)", colorDetails: [
            ColorDetails(name: "contentInverse", colorToken: .contentInverse),
            ColorDetails(name: "contentSubtleInverse", colorToken: .contentSubtleInverse),
            ColorDetails(name: "contentDisabledInverse", colorToken: .contentDisabledInverse),
            ColorDetails(name: "contentSuccessInverse", colorToken: .contentSuccessInverse),
            ColorDetails(name: "contentCriticalInverse", colorToken: .contentCriticalInverse),
            ColorDetails(name: "borderInverse", colorToken: .borderInverse),
            ColorDetails(name: "dividerInverse", colorToken: .dividerInverse)
        ]),
        ColorCategory(name: "Actions", colorDetails: [
            ColorDetails(name: "actionPrimarySlice", colorToken: .actionPrimary),
            ColorDetails(name: "actionPrimaryBold", colorToken: .actionPrimaryBold),
            ColorDetails(name: "actionSecondary", colorToken: .actionSecondary),
            ColorDetails(name: "actionDisabled", colorToken: .actionDisabled),
            ColorDetails(name: "actionIcon", colorToken: .actionIcon)
        ]),
        ColorCategory(name: "Actions (Inverse)", colorDetails: [
            ColorDetails(name: "actionPrimaryInverse", colorToken: .actionPrimaryInverse),
            ColorDetails(name: "actionPrimaryBoldInverse", colorToken: .actionPrimaryBoldInverse),
            ColorDetails(name: "actionSecondaryInverse", colorToken: .actionSecondaryInverse),
            ColorDetails(name: "actionDisabledInverse", colorToken: .actionDisabledInverse)
        ]),
        ColorCategory(name: "Rating Scale", colorDetails: [
            ColorDetails(name: "rating9", colorToken: .rating9),
            ColorDetails(name: "rating8", colorToken: .rating8),
            ColorDetails(name: "rating7", colorToken: .rating7),
            ColorDetails(name: "rating6", colorToken: .rating6),
            ColorDetails(name: "rating5", colorToken: .rating5),
        ]),
        ColorCategory(name: "Rating Scale (Inverse)", colorDetails: [
            ColorDetails(name: "rating9Inverse", colorToken: .rating9Inverse),
            ColorDetails(name: "rating8Inverse", colorToken: .rating8Inverse),
            ColorDetails(name: "rating7Inverse", colorToken: .rating7Inverse),
            ColorDetails(name: "rating6Inverse", colorToken: .rating6Inverse),
            ColorDetails(name: "rating5Inverse", colorToken: .rating5Inverse),
        ])
    ]

    var body: some View {
        List(categories, id: \.self) { category in
            MyColorCategoryView(category: category)
        }
        .navigationTitle("Colors - \(themeEngine.currentThemeType.description)")
        .toolbar {
            Button("Change Theme") {
                self.showThemeActionSheet = true
            }
        }
        .actionSheet(isPresented: $showThemeActionSheet) {
            ActionSheet(title: Text("Change the theme"),
                        message: nil,
                        buttons: [
                            .default(Text(ThemeType.legacy.description),
                                     action: {
                                         themeEngine.set(.legacy)
                                     }),
                            .default(Text(ThemeType.metalabsv1.description),
                                     action: {
                                         themeEngine.set(.metalabsv1)
                                     }),
                            .default(Text(ThemeType.silly.description),
                                     action: {
                                         themeEngine.set(.silly)
                                     }),
                            .cancel()
                        ])
        }
    }
}

struct ColorDetails: Hashable {
    var id: UUID = UUID()
    var name: String
    var colorToken: ColorToken
}

struct ColorCategory: Hashable {
    var id: UUID = UUID()
    var name: String
    var colorDetails: [ColorDetails]
}

struct MyColorCategoryView: View {
    var category: ColorCategory

    var body: some View {
        Section {
            ForEach(category.colorDetails, id: \.self) { color in
                MyColorPreview(color.name, color.colorToken)
            }
        } header: {
            Text(category.name)
        }
    }
}

struct MyColorPreview: View {
    var text: String
    var colorToken: ColorToken

    init(_ text: String, _ color: ColorToken) {
        self.text = text
        self.colorToken = color
    }

    var body: some View {
        HStack {
            Circle()
                .foregroundColor(colorToken)
                .overlay(Circle().stroke(.border, lineWidth: 1))
                .frame(width: 20, height: 20, alignment: .leading)
            Text(text)
            Spacer()
        }
    }
}

struct MyColorsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MyColorsPreviewView()
        MyColorsPreviewView()
            .themeType(.silly)
    }
}
