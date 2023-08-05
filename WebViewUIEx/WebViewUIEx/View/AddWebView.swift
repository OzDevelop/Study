//
//  AddWebView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

struct AddWebView: View {
    @ObservedObject var webModel: WebModel
    
    @State var addName: String = ""
    @State var addURL: String = "https://"
    
    @Binding var isShowingAddSheet: Bool
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("사이트명")) {
                    TextField("애플", text: $addName)
                }
                Section(header: Text("주소명")) {
                    TextField("주소명", text: $addURL)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingAddSheet = false
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddSheet = false
                        webModel.addWeb(web: Web(name: addName, urlString: addURL))
                        print(isShowingAddSheet)
                    } label: {
                        Text("추가")
                    }
                    .disabled(addName.isEmpty)
                    
                    
                    // 아무것도 입력되지 않았다면 추가 버튼이 눌리지 않도록 수정하기
                }
            }
        }
    }
}

struct AddWebView_Previews: PreviewProvider {
    static var previews: some View {
        AddWebView(webModel: WebModel(), isShowingAddSheet: .constant(false))
    }
}
