//
//  ClosureDetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataMainVC(_ sender: Any) {
        myClosure?("closure string")
        self.dismiss(animated: true)
    }
    
}
