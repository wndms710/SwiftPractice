//
//  NotificationDetailViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class NotificationDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func notiAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noit string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
        self.dismiss(animated: true)
    }
    
}
