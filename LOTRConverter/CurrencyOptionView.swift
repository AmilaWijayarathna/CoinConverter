//
//  CurrencyOptionView.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-09.
//

import SwiftUI

struct CurrencyOptionView: View {
    
    @Binding var currency : Currency
    @Binding var coinCount : String
    
    @Binding var otherCurrency : Currency
    @Binding var otherCoinCount : String
    
    @Binding var showSelectCurrencyView : Bool
    @FocusState var leftTyping
    
    var body: some View {
        
        VStack{
            //coin text
            
            HStack{
                //coin
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                //text
                Text(currency.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
            }
            .padding(.bottom,-5)
            .onTapGesture {
                showSelectCurrencyView.toggle()
            }
            
            TextField("Amount", text: $coinCount)
                .textFieldStyle(.roundedBorder)
//                .focused($leftTyping)
                .keyboardType(.decimalPad)
            //textfield
        }
        .onChange(of: coinCount) {
                self.otherCoinCount = self.currency.convertTo(amount: coinCount, currency: self.otherCurrency)
        }
    }
}

#Preview {
    CurrencyOptionView(currency: .constant(.copperPenny), coinCount: .constant("100"),otherCurrency: .constant(.goldPenny),otherCoinCount: .constant("20"), showSelectCurrencyView: .constant(false))
}
