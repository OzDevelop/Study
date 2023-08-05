//
//  ContentView.swift
//  LottoNumber
//
//  Created by 변상필 on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            LottoMainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
