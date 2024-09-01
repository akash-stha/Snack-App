//
//   Category.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-18.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id = UUID()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "waffles", title: "Waffles"),
    CategoryModel(icon: "toffee", title: "Toffee"),
]
