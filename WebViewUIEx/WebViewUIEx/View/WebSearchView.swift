//
//  WebSearchView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

struct WebSearchView: View {
    @State var searchURL: String = "https://"
    @State var isShowingSearchCheet: Bool = false
    
    var webModel: WebModel
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Input URL")){
                    TextField("주소명", text: $searchURL)
                }
                Button {
                    isShowingSearchCheet = true
                    webModel.addWebHistory(webHistory: WebHistory(urlString: searchURL, date: Date()))
                    searchURL = ""
                } label: {
                    Text("Search")
                }
                .disabled(searchURL.isEmpty)
         // url 정규표현식 적용하기a
            }
            .sheet(isPresented: $isShowingSearchCheet) {
                SafariWebView(siteURL: searchURL)
            }
        }
    }
}

struct WebSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WebSearchView(webModel: WebModel())
    }
}
