//
//  DelegateDetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(String: String)
}

class DelegateDetailViewController: UIViewController {
    
    weak var delegate: DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func passDataMainVC(_ sender: Any) {
        delegate?.passString(String: "delegate pass Data")
        self.dismiss(animated: true)
    }
    
}
