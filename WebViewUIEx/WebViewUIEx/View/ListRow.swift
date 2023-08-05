//
//  ListRow.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

struct ListRow: View {
    var web: Web = Web(name: "naver", urlString: "123")
    
    var body: some View {
        HStack {
            Text("\(web.name)")
                .font(.largeTitle)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow()
    }
}
