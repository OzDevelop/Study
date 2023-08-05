//
//  ContentView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI

/*
1. 화면에 웹사이트 목록을 나타내봅시다 -> List O
2. 처음엔 아무것도 없겠죠
3. "추가" 버튼을 눌러서 웹사이트 제목과 주소를 입력받아 목록에 추가할 수 있게 합시다 -> toolbar? .sheet O
4. 추가된 내용은 원하면 삭제도 하게 해줍시다 -> List delete O
5. 목록에서 특정 항목을 누르면 해당 웹사이트가 화면에 나타나도록 합시다 -> safari O
 
6. 시간 좀 남으면 UserDefaults에 목록이 저장되어 다음에 앱을 실행해도 목록이 유지되도록 합시다
*/

/*
 23.08.03
 - 구현한 내용 -
 ( + ) 버튼을 이용해서 URL 추가
 리스트, 히스토리 태그 구분
 서치 뷰를 이용해서 url로 직접 검색 가능
 웹 뷰 접속 시 history 기록으로 남음
 
 - 추가할 내용 -
 history 정렬 및 ui 개선
 userdefaults 등을 이용해 데이터 저장
 Observed 쓰는거 environment로 바꿔보기
 
 */
 /*
  search view에서 직접 검색해서 들어갈 경우 디폴트인 애플주소로 자꾸 가짐
  */

struct ContentView: View {
    @ObservedObject private var webModel = WebModel()
    
    var body: some View {
        TabView {
            ListView(webModel: webModel)
                .tabItem {
                    Text("List")
                }
            HistoryView(webModel: webModel)
                .tabItem {
                    Text("Histroy")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
