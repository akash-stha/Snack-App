//
//  CollectionView.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-19.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack() {
                        Text("Order From The Best Of **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button(action: {
                            mode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke().opacity(0.4))
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(productList, id: \.id) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    })
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}

struct SmallProductCard: View {
    
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 200)
                .opacity(0.5)
                .padding(.trailing, -230)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(product.category)
                        .font(.caption)
                        .padding()
                        .background(.white.opacity(0.4))
                        .clipShape(Capsule())
                        .frame(alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).00")
                            .font(.system(size: 18, weight: .bold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 30)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                })
            }
        }
        .padding()
        .frame(width: 180, height: 220)
        .background(product.color.opacity(0.12))
        .clipShape(.rect(cornerRadius: 22))
    }
}
