//
//  SelectCurrencyView.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-09.
//

import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
   
    
    var body: some View {
        
        ZStack{
            
            Image(.parchment)
                .resizable()
                .background(.brown)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Select the currency you are starting with")
                    .fontWeight(.bold)
                

                IconGridView(currency: $topCurrency)
               
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                IconGridView(currency: $bottomCurrency)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrencyView(topCurrency: .constant(.silverPenny), bottomCurrency: .constant(.goldPenny))
}
