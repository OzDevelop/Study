//
//  TabBarViewController.swift
//  iOS_035_ByeonSangPil
//
//  Created by 변상필 on 2023/07/30.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tabBar.backgroundColor = .systemBackground
        tabBar.barTintColor = .systemBackground
        
        let countViewController = CountViewController()
        let historyViewController = HistoryViewController()
        let helpViewController = HelpViewController()
        
        countViewController.tabBarItem = UITabBarItem(title: "Count", image: UIImage(systemName: "stopwatch"), tag: 0)
        historyViewController.tabBarItem = UITabBarItem(title: "Histroy", image: UIImage(systemName: "list.bullet.rectangle"), tag: 1)
        helpViewController.tabBarItem = UITabBarItem(title: "How", image: UIImage(systemName: "questionmark.square"), tag: 2)
        
        viewControllers = [countViewController, historyViewController, helpViewController]
    }
}
