//
//  SegueDetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class SegueDetailViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = dataString
    }


}
