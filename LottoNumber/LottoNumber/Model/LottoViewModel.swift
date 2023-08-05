//
//  LottoViewModel.swift
//  LottoNumber
//
//  Created by 변상필 on 2023/07/12.
//

import Foundation
import SwiftUI

class LottoViewModel: ObservableObject {
    @Published var lottoData: [LottoData] = []
    
    
    func generatedRandomNum(first: Int = 1, Last: Int = 45) {
        let lotto: LottoData = LottoData(FirstNum: first, LastNum: Last)

        lottoData.insert(lotto, at: 0)
        print(lottoData)
//        print(lottoData[0].color)
        
    }
    
    func removeAll() {
        lottoData.removeAll()
        
    }
}
