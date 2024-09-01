//
//  ContentView.swift
//  Snacks App
//
//  Created by Akash Shrestha on 2024-08-17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom, content: {
                Home()
                    .environmentObject(cartManager)
                
                if cartManager.products.count > 0 {
                    NavigationLink(destination: CartView()) {
                        HStack(spacing: 22) {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading, content: {
                                Text("Cart")
                                    .font(.system(size: 22, weight: .bold))
                                
                                Text("\(cartManager.products.count) " + (cartManager.products.count > 1 ? "Items" : "Item"))
                                    .font(.system(size: 14))
                            })
                            
                            Spacer()
                        }
                        .padding(25)
                        .frame(width: .infinity, height: 90)
                        .background(.black).opacity(0.9)
                        .clipShape(.rect(cornerRadius: 25))
                        .foregroundColor(.white)
                        //                .padding(.horizontal, 20)
                        //                .padding(.bottom, -10)
                        .clipShape(.rect(topLeadingRadius: 40, topTrailingRadius: 40))
                    }
                }
            })
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
