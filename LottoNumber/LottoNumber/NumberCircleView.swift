//
//  NumberCircleView.swift
//  LottoNumber
//
//  Created by 변상필 on 2023/07/12.
//

import SwiftUI

struct NumberCircleView: View {
//    @ObservedObject var lottoViewModel: LottoViewModel = LottoViewModel()
    var lottoData: LottoData
    var index: Int = 0
    
    var body: some View {
        
            VStack {
                HStack(spacing: 10) {
                    ZStack{
                            Circle()
                                .foregroundColor(lottoData.color[index])
                            Text("\(lottoData.result[index])")
                                
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        

                }
                .frame(height: 80)

            }
           
        }
        
        
    }
}

struct NumberCircleView_Previews: PreviewProvider {
    static var previews: some View {
        NumberCircleView(lottoData: LottoData(FirstNum: 1, LastNum: 45))
    }
}
