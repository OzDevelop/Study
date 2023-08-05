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
    
    @ObservedObject var webModel: WebModel
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Input URL")){
                    TextField("주소명", text: $searchURL)
                        .autocapitalization(.none) // 자동 대문자 비활성화
                        .disableAutocorrection(true) // 자동 수정 비활성화
                        .keyboardType(.URL) // 키보드 타입 변경
                        
                }
                Button {
                    isShowingSearchCheet = true
                    webModel.addWebHistory(webHistory: WebHistory(urlString: searchURL, date: Date()))

                    print("searchURL은 뭘까용\(searchURL)")
                } label: {
                    Text("Search")
                }
                .disabled(searchURL.isEmpty)


         // url 정규표현식 적용하기a
            }
            .sheet(isPresented: $isShowingSearchCheet, onDismiss: {
                searchURL = "https://"
                //sheet가 onDismiss 될 때 searchURL 값 초기화
                
            }) {
                SafariWebView(siteURL: $searchURL)
            }

        }
    }
}

struct WebSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WebSearchView(webModel: WebModel())
    }
}
