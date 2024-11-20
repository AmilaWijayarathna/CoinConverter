//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-09.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
   
    
    var body: some View {

        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                Text("Echange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .bold()
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                ExchangeRateView(leftImage: .goldpiece, text: "1 Gold Piese = 4 Gold Pennies", rightImage: .goldpenny)
                
                ExchangeRateView(leftImage: .goldpiece, text: "1 Gold Piese = 4 Silver Pieses", rightImage: .silverpiece)
                
                ExchangeRateView(leftImage: .silverpiece, text: "1 Silver Piese = 4 Silver Pennies", rightImage: .silverpenny)
                                
                ExchangeRateView(leftImage: .silverpenny, text: "1 Silver Piese = 100 Copper Pennies", rightImage: .copperpenny)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
