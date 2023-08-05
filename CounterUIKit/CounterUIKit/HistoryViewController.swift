//
//  StoreViewController.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let tableView = UITableView()
    var saveCount: [Count] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTableView()
        setupLayout()
        loadCountsFromUserDefaults()
    }
    
    func loadCountsFromUserDefaults() {
        let data = UserDefaults.standard.array(forKey: "saveCount") as? [Data] ?? []
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            // data 배열의 값들을 디코딩
            saveCount = try data.map { try decoder.decode(Count.self, from: $0) }
            saveCount.sort { $0.date > $1.date }
        } catch {
            print("JSON 디코딩 실패")
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // 커스텀 셀 등록
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
    }
    
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
             tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
             tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
         ])
    }
}

// 셀 높이 설정
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 
    }
}
