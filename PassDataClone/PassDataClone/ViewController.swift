//
//  ViewController.swift
//  PassDataClone
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    // 6. notification
        let notificationName = Notification.Name("sendSomeString")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    }
    
    @objc func keyboardWillShow() {
        print("will show")
    }
    @objc func keyboardDidShow() {
        print("did show")
    }
    
    
    // 1. instance property
    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "하잉"
            }
    
    
    // 2. Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "aa"
            }
        }
    }

    
    @IBOutlet weak var dataLabel: UILabel!
    
    // 3. instance
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 4. delegate pattern
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    // 5. closure
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        detailVC.myClosure = {str in
            self.dataLabel.text = str
        }
        self.present(detailVC, animated: true, completion: nil)
    }

    @IBAction func moveToNoti(_ sender: Any) {
        let detailVC = NotificationDetailViewController(nibName: "NotificationDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(String: String) {
        self.dataLabel.text = String
    }
}
