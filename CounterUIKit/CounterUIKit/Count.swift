//
//  Counts.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import Foundation

// userdefaults를 쓰기 위해서 인코딩, 디코딩하려고 codable 채택
struct Count: Codable {
    var count: Int
    var date: Date
    
    var dateString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd EEEE HH:mm"
        
        return dateFormatter.string(from: date)
    }
}


