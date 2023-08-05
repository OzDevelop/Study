//
//  ViewController.swift
//  ViewLifecycleTest
//
//  Created by 변상필 on 2023/07/22.
//

import UIKit

class ViewController1: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("move VC2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5 // 테두리 두께
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(moveVC2), for: .touchUpInside)
        
        return button
    }()
    @objc func moveVC2() {
        let viewController2 = ViewController2()
        navigationController?.pushViewController(viewController2, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        print("VC1 viewDidLoad Called")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC1 viewWillAppear Called")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC1 viewDidAppear Called")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC1 viewWillDisappear Called")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC1 viewDidDisappear Called")

    }


}

