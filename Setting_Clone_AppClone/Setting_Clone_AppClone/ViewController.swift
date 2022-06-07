//
//  ViewController.swift
//  Setting_Clone_AppClone
//
//  Created by 조주은 on 2022/06/02.
//

import UIKit

class ViewController: UIViewController {
    
    var settingModel = [[SettingModel]]()
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuTitle: "iPhone에 로그인", subTitle: "iCloud, App Store 등 설정", rightImageName: nil)]
        )
        
        settingModel.append(
        [SettingModel(leftImageName: "hourglass", menuTitle: "스크린 타임", subTitle: nil, rightImageName: "chevron.right")]
        )
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "일반", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "손쉬운 사용", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "hand.raised.fill", menuTitle: "개인 정보 보호", subTitle: nil, rightImageName: "chevron.right")]
        )
        
        settingModel.append(
        [SettingModel(leftImageName: "key", menuTitle: "암호", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        makeData()
        
        title = "설정"
        self.view.backgroundColor = UIColor(white: 245/255, alpha: 1)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.titleLabel.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        cell.rightImageView.tintColor = .lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 50
    }
    
}
