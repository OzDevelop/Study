//
//  WebModel.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import Foundation

class WebModel: ObservableObject {
    @Published var webs: [Web] = []
    @Published var webHistories: [WebHistory] = []
    
    init() {
        webs = [
        Web(name: "Naver", urlString: "https://www.naver.com")
        ]
        webHistories = [
        WebHistory(urlString: "https://www.naver.com", date: Date())
        ]
    }
    
    func addWeb(web: Web) {
        webs.append(web)
    }
    
    func addWebHistory(webHistory: WebHistory) {
        webHistories.append(webHistory)
        //print("\(webHistory) append 됌")
        print("----전체 히스토리 ----")
        print("\(webHistories)")
    }
    
}

extension WebModel {
    
}
