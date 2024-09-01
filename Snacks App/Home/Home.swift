//
//  Home.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-17.
//

import SwiftUI

struct Home: View {
    
    // MARK: Category View Properties
    @State var selectedCategory = "All"
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: Header
                    HStack() {
                        Text("Order From The Best Of **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // MARK: Category List
                    CategoryListView
                    
                    // MARK: Collection View
                    HStack {
                        Text("Choco **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // MARK: Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .resizable()
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                Text(item.title)
                                    .frame(height: 20)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
    
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

// MARK: Product Card View
struct ProductCard: View {
    
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 286, height: 382)
                .opacity(0.5)
                .padding(.trailing, -230)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 30, weight: .semibold))
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.4))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).00")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 80, height: 60)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                })
            }
            
        }
        .padding(30)
        .frame(width: 326, height: 422)
        .background(product.color.opacity(0.12))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}
