//
//  CartView.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-19.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack() {
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.3))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(30)
                    
                    // MARK: Cart Products
                    VStack(spacing: 20) {
                        ForEach(cartManager.products, id: \.name) { item in
                            CardProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    // MARK: Total Amount
                    VStack(alignment: .trailing) {
                        HStack {
                            Text("Delivery Amount")
                            Spacer()
                            Text("Free")
                                .font(.system(size: 24))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 20))
                        
                        Text("CAD \(cartManager.total)")
                            .font(.system(size: 36, weight: .semibold))
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 25))
                    .padding()
                    
                    
                    // MARK: Button to make payment
                    Button {
                        
                    } label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(.rect(cornerRadius: 25))
                            .padding()
                    }
                }
            }
        }  
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}


// MARK: Cart Product View
struct CardProductCard: View {
    
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 70, height: 70)
                .background(.gray.opacity(0.15))
                .clipShape(Circle())
                        
            VStack(alignment: .leading, content: {
                Text(product.name)
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()

            Text(" $\(product.price).00 ")
                .frame(width: .infinity, height: 60)
                .background(.yellow.opacity(0.5))
                .cornerRadius(12)
        }
//        .padding(.vertical, 8)
//        .padding(.horizontal, 20) 
    }
}
