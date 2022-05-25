//
//  InstanceDetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class InstanceDetailViewController: UIViewController {
    
    var mainVC : ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func sendDataMainVC(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }
    

}
