//
//  SafariWebView.swift
//  WebViewUIEx
//
//  Created by 변상필 on 2023/08/03.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable  {
    @Binding var siteURL : String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        if let url = URL(string: siteURL) {
            print("url 성공")
            return SFSafariViewController(url: url)
        } else {
            return SFSafariViewController(url: URL(string: "https://developer.apple.com/")!)
        }
        // 여기서 무조건 else문으로 빠지네
        
//        guard let url = URL(string: siteURL) else { return SFSafariViewController(url: URL(string: "https://developer.apple.com/")!) }
//        return SFSafariViewController(url: url)
        
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

}

