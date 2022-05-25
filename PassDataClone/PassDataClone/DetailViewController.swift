//
//  DetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var someLabel: UILabel!
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.text = someString
    }

}
