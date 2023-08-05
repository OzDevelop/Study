//
//  ListView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var webModel: WebModel
    @State var web: Web = Web(name: "", urlString: "https://www.naver.com")
    
    @State var isShowingAddSheet = false
    @State var isShowingSafiriSheet = false

    var body: some View {
        NavigationStack{
            List {
                ForEach(webModel.webs) { web in
                    Button {
                        isShowingSafiriSheet = true
                        self.web = web
                        webModel.addWebHistory(webHistory: WebHistory(urlString: web.urlString, date: Date()))
                        print(self.web.urlString)
                    } label: {
                        ListRow(web: web)
                    }
                    .buttonStyle(.plain)
                }
                .onDelete { IndexSet in
                        webModel.webs.remove(atOffsets: IndexSet)
                  
                }
            }
            .navigationTitle("URL")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Label("추가하기", systemImage: "plus")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        WebSearchView( webModel: webModel)
                    } label: {
                        Label("직접 입력", systemImage: "magnifyingglass")
                    }
                }
            }
            
            .sheet(isPresented: $isShowingAddSheet) {
                AddWebView(webModel: webModel, isShowingAddSheet: $isShowingAddSheet)
            }
            .sheet(isPresented: $isShowingSafiriSheet) {
                SafariWebView(siteURL: $web.urlString)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(webModel: WebModel())
    }
}
