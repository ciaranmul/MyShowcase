//
//  MyColorsPreviewView.swift
//  MyShowcase
//
//  Created by Ciarán Mulholland on 11/10/2021.
//

import SwiftUI
import MyStyles

struct MyColorsPreviewView: View {

    var categories: [ColorCategory] = [
        ColorCategory(name: "Surfaces", colorDetails: [
            ColorDetails(name: "surface", color: .surface),
            ColorDetails(name: "background", color: .background)
        ]),
        ColorCategory(name: "Content", colorDetails: [
            ColorDetails(name: "content", color: .content),
            ColorDetails(name: "contentSubtle", color: .contentSubtle),
            ColorDetails(name: "contentDisabled", color: .contentDisabled),
            ColorDetails(name: "contentSuccess", color: .contentSuccess),
            ColorDetails(name: "contentCritical", color: .contentCritical),
            ColorDetails(name: "border", color: .border),
            ColorDetails(name: "divider", color: .divider)
        ]),
        ColorCategory(name: "Actions", colorDetails: [
            ColorDetails(name: "actionPrimarySlice", color: .actionPrimary),
            ColorDetails(name: "actionPrimaryBold", color: .actionPrimaryBold),
            ColorDetails(name: "actionSecondary", color: .actionSecondary),
            ColorDetails(name: "actionDisabled", color: .actionDisabled),
            ColorDetails(name: "actionIcon", color: .actionIcon),
        ]),
        ColorCategory(name: "Rating Scale", colorDetails: [
            ColorDetails(name: "rating9", color: .rating9),
            ColorDetails(name: "rating8", color: .rating8),
            ColorDetails(name: "rating7", color: .rating7),
            ColorDetails(name: "rating6", color: .rating6),
            ColorDetails(name: "rating5", color: .rating5),
        ])
    ]

    var body: some View {
        List(categories, id: \.self) { category in
            MyColorCategoryView(category: category)
        }
    }
}

struct ColorDetails: Hashable {
    var id: UUID = UUID()
    var name: String
    var color: MyColor
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
                MyColorPreview(color.name, color.color)
            }
        } header: {
            Text(category.name)
        }
    }
}

struct MyColorPreview: View {
    var text: String
    var color: MyColor

    init(_ text: String, _ color: MyColor) {
        self.text = text
        self.color = color
    }

    var body: some View {
        HStack {
            Circle()
                .foregroundColor(color)
                .overlay(Circle().stroke(MyColor.border, lineWidth: 1))
                .frame(width: 20, height: 20, alignment: .leading)
            Text(text)
            Spacer()
        }
    }
}

struct MyColorsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MyColorsPreviewView()
    }
}
