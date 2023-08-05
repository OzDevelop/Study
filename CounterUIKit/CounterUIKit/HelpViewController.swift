//
//  HelpViewController.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import UIKit

class HelpViewController: UIViewController {
    
    let message: String = """
사용 방법
1. Count 탭의 화면을 터치하면 숫자가 증가합니다.
2. save 버튼을 이용해 현재 숫자를 저장할 수 있습니다.
3. reset 버튼을 이용해 숫자를 0으로 초기화할 수 있습니다.
4. 저장한 숫자는 History 탭에서 확인할 수 있습니다.
5. 숫자는 옆으로 슬라이드하여 삭제할 수 있습니다.
"""
    lazy var helpLabel: UILabel = {
        let label = UILabel()
        
        // 사용 방법이라는 글자만 크기를 조절하고 싶었는데 안됐음, 찾아보자
        let attributeString = NSMutableAttributedString(string: message)
        let font = UIFont.systemFont(ofSize: 60)
        
        attributeString.addAttribute(.font, value: font, range: (message as NSString).range(of: "사용 방법"))
        label.attributedText = attributeString

        label.numberOfLines = 0
//        label.text = message
        label.font = UIFont.systemFont(ofSize: 20)
        

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// 이건 안되고 밑에 껀 바로 되는 이유를 모르겠음
//    let labelContainerView = UIView()
//    
//    labelContainerView.backgroundColor = UIColor.clear
//    labelContainerView.layer.borderColor = UIColor.black.cgColor
//    labelContainerView.layer.borderWidth = 2.0
//    labelContainerView.translatesAutoresizingMaskIntoConstraints = false
    let labelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    func setupLayout() {
        labelContainerView.addSubview(helpLabel)
        view.addSubview(labelContainerView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            labelContainerView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            labelContainerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            labelContainerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            labelContainerView.heightAnchor.constraint(equalToConstant: 350),
            
            helpLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant: 20),
            helpLabel.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 20),
            helpLabel.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: 0),
        ])
    }
}
