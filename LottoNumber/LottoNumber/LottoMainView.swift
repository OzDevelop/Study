//
//  LottoMainView.swift
//  LottoNumber
//
//  Created by 변상필 on 2023/07/12.
//

import SwiftUI

struct LottoMainView: View {
    @ObservedObject var lottoViewModel: LottoViewModel = LottoViewModel()
    @State var range: Bool = false
    
    var body: some View {
        VStack {
            
            List(lottoViewModel.lottoData) { lotto in
                HStack{
                    ForEach(0..<6) { i in
                        NumberCircleView(lottoData: lotto, index: i)
                    }
                    
                }
    }
        }
        .navigationTitle("로또 번호")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    range = true
                } label: {
                    Label("추가", systemImage: "plus")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button("추가") {
                    lottoViewModel.generatedRandomNum()

                }

            }
            ToolbarItem(placement: .bottomBar) {
                Button("삭제") {
                    // 전체 삭제 기능 구현
                    lottoViewModel.removeAll()
                }

            }
        }
        .onAppear{
            lottoViewModel.generatedRandomNum()
            
        }
        
    }
        
}

struct LottoMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LottoMainView()
        }
    }
}
