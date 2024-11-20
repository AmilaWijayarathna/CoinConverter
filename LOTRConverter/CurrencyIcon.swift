//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-09.
//

import SwiftUI

struct CurrencyIcon: View {
    
    let currencyImage : ImageResource
    let currencyName : String
    
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            Image(currencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.7))
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
}
