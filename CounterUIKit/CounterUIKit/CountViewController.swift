//
//  CountViewController.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import UIKit

class CountViewController: UIViewController {
    
    var count: Int = 0
    
    // 맞는지는 모르겠지만 count의 값을 사용하려고 lazy로 선언
    // count 숫자 표시 및 증가 버튼
    lazy var countButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(count)", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 1.0
//        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        
        button.addTarget(self, action: #selector(countUp), for: .touchUpInside)
        return button
    }()
    
    @objc func countUp() {
        count += 1
        countButton.setTitle("\(count)", for: .normal)
        // 다시 켰을때 증가했던 count 값을 유지하기 위해서 사용
        UserDefaults.standard.set(self.count, forKey: "count")
    }
    
    // count를 0으로 초기화하는 버튼
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 1.0
//        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        button.addTarget(self, action: #selector(resetCount), for: .touchUpInside)
        return button
    }()
    
    @objc func resetCount() {
        count = 0
        countButton.setTitle("\(count)", for: .normal)
    }
    
    // 현재 count의 값을 저장하는 버튼
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("save", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 1.0
//        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        button.addTarget(self, action: #selector(saveCount), for: .touchUpInside)
        
        return button
    }()

    /*
     저장될 때 저장이 되었음을 확인할 수 있도록 숫자를 깜빡거린다든지의 이펙트가 있으면 좋지 않을까?
     */
    @objc func saveCount() {
        
        // 저장할 count 생성
        let savingCount: Count = Count(count: count, date: Date())
        let alertController = UIAlertController(title: nil, message: "저장되었습니다", preferredStyle: .alert)
        
        present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            alertController.dismiss(animated: true, completion: nil)
        }
        
        // 저장된 userdefaults 배열 불러오기
        var savedCounts = UserDefaults.standard.array(forKey: "saveCount") as? [Data] ?? []
        
        do {
            let encoder: JSONEncoder = JSONEncoder()
            let data = try encoder.encode(savingCount)
            // 불러온 count 배열에 인코딩한 저장할 count data 추가
            savedCounts.append(data)
            // 다시 저장
            UserDefaults.standard.set(savedCounts, forKey: "saveCount")
        } catch {
            print("encoding 실패")
        }
        
        if let historyVC = self.tabBarController?.viewControllers?[1] as? HistoryViewController {
            historyVC.loadCountsFromUserDefaults()
            historyVC.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        loadCount()
        setupLayout()
    }

    func setupLayout() {
        let buttonStackView = UIStackView()
        
        buttonStackView.axis = .horizontal
        buttonStackView.addArrangedSubview(saveButton)
        buttonStackView.addArrangedSubview(resetButton)
        buttonStackView.distribution = .fillEqually
        
        [countButton, buttonStackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            countButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            countButton.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: 0),
            countButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            countButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            buttonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -30),
            buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            buttonStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // 저장했던 count 값 불러오기
    func loadCount() {
        count = UserDefaults.standard.integer(forKey: "currentCount")
            countButton.setTitle("\(count)", for: .normal)
    }
}
