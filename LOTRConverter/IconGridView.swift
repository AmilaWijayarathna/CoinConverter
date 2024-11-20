//
//  IconGridView.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-12.
//

import SwiftUI

struct IconGridView: View {
    
    @Binding var currency : Currency
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], content: {
            
            ForEach(Currency.allCases){currency in
                
                if self.currency == currency{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color:.black,radius:  10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 2)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture{
                            self.currency = currency
                        }
                }
            }
           
        })
    }
}

#Preview {
    IconGridView(currency: .constant(.copperPenny))
}
