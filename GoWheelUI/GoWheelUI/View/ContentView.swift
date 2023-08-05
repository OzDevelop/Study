//
//  ContentView.swift
//  GoWheelUI
//
//  Created by 변상필 on 2023/08/05.
//

import SwiftUI

/*
SwiftUI 애니메이션을 이용해서 돌림판을 만들어 보자
프로젝트 생성일: 23.08.06
- 구현할 기능 -
1. 애니메이션을 이용해서 돌아가는 돌림판을 생성
2. + 툴바를 이용해 돌림판의 요소를 추가
 2.1 돌림판의 요소는 추가될때마다 정확히 등분으로 나눔
3. 돌아가는 시간을 랜덤으로 하여 돌림판 요소를 무작위로 선택
4. 선택된 요소는 alert를 이용해서 표시되도록 하기
 */

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("돌려 돌려 돌림판!")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // 돌림판 기능 추가하기
                    } label: {
                        Label("Add", systemImage: "plus")
                    }

                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
