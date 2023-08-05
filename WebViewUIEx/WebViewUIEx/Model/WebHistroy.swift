//
//  WebHistroy.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import Foundation

struct WebHistory: Identifiable {
    var id: UUID = UUID()
//    var name: String
    var urlString: String
    var date: Date
}
