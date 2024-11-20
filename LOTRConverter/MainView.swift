//
//  MainView.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-07.
//

import SwiftUI
import TipKit

struct MainView: View {
    
    @State var showInfoView : Bool = false
    
    @State var showSelectCurrencyView : Bool = false
    @State var leftCoinCount : String = ""
    @State var rightCoinCount : String = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency : Currency = .goldPiece
    
    var body: some View {
        ZStack{
            //bgImage
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                //ponyImage
                
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    
                
                //title
                Text("Currency Converter")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                
                //conversionView
                
                HStack{
                    //leftView
                    
                    CurrencyOptionView(currency: $leftCurrency, coinCount: $leftCoinCount,otherCurrency: $rightCurrency,otherCoinCount: $rightCoinCount, showSelectCurrencyView: $showSelectCurrencyView)
                        
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                    //=
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //rightView
                    
                    CurrencyOptionView(currency: $rightCurrency, coinCount: $rightCoinCount,otherCurrency: $leftCurrency,otherCoinCount: $leftCoinCount, showSelectCurrencyView: $showSelectCurrencyView)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                //Info
                HStack {
                    Spacer()
                    
                    Button{
                        showInfoView.toggle()
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showInfoView) {
                         ExchangeInfo()
                    }
                    
                }
                .task {
                    try? Tips.configure()
                }
                
                .sheet(isPresented: $showSelectCurrencyView) {
                     SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                }

                .onChange(of: rightCurrency) {
                    
                    self.rightCoinCount = self.leftCurrency.convertTo(amount: leftCoinCount, currency: self.rightCurrency)
                    
                }
                
                .onChange(of: leftCurrency) {
                    
                    self.leftCoinCount = self.rightCurrency.convertTo(amount: rightCoinCount, currency: self.leftCurrency)
                    
                }

                
            }
            
        }
    }
}

#Preview {
    MainView()
}
