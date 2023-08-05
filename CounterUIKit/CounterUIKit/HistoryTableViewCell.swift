//
//  HistoryTableViewCell.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    func setupLayout() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(dateLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}

extension HistoryViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return saveCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as!
        HistoryTableViewCell
        let indexInfo = saveCount[indexPath.row]
        
        cell.countLabel.text = "\(indexInfo.count)"
        cell.dateLabel.text = "\(indexInfo.dateString)"
        
        return cell
    }
    
    // 슬라이드로 셀 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            saveCount.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // 수정된 saveCount를 UserDefaults에 다시 저장
            do {
                let encoder: JSONEncoder = JSONEncoder()
                let data = try saveCount.map { try encoder.encode($0) }
                UserDefaults.standard.set(data, forKey: "saveCount")
            } catch {
                print("JSON 인코딩 실패")
            }
            
        }
    }
}
