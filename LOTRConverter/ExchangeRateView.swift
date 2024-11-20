//
//  ExchangeRateView.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-09.
//

import SwiftUI

struct ExchangeRateView: View {
    
    
    let leftImage : ImageResource!
    let text : String!
    let rightImage : ImageResource!
   
    
    var body: some View {
       
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRateView(leftImage: .goldpiece, text: "1 Gold Piese = 4 Gold Pennies", rightImage: .goldpenny)
}
