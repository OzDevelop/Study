//
//  HistoryView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var webModel: WebModel
    
    var body: some View {
        List {
            ForEach(webModel.webHistories) { web in
                HStack {
                    Text("\(web.urlString)")
                    Text("\(web.date)")
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(webModel: WebModel())
    }
}
