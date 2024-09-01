//
//  ProductModel.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-18.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var image: String
    var price: Int
    var color: Color
}

// Sample Product
var productList = [
    Product(name: "Apple", category: "Cateogry 1", image: "chips", price: 8, color: .pink),
    Product(name: "Banana", category: "Cateogry 1", image: "chips", price: 8, color: .yellow),
    Product(name: "Carrot", category: "Cateogry 1", image: "chips", price: 8, color: .red),
    Product(name: "Dragon Fruit", category: "Cateogry 1", image: "chips", price: 8, color: .blue),
    Product(name: "Melon", category: "Cateogry 1", image: "chips", price: 8, color: .brown),
    Product(name: "Mango", category: "Cateogry 1", image: "chips", price: 8, color: .orange),
    Product(name: "Papaya", category: "Cateogry 1", image: "chips", price: 8, color: .purple),
]
