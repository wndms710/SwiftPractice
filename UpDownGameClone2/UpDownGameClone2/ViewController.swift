//
//  ViewController.swift
//  UpDownGameClone2
//
//  Created by 조주은 on 2022/05/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var tryCount: Int = 0
    var randomValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let intValue = Int(sender.value)
        sliderValueLabel.text = String(intValue)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset")
        reset()
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        if randomValue == hitValue {
            print("YOU HIT!!")
            showAlert(message: "YOU HIT!!")
        } else if tryCount == 5 {
            print("You lose...")
            showAlert(message: "You lose...")
        } else if randomValue > hitValue {
            minimumValueLabel.text = String(hitValue)
            slider.minimumValue = slider.value
        } else if randomValue < hitValue {
            maximumValueLabel.text = String(hitValue)
            slider.maximumValue = slider.value
        }
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func reset() {
        print("reset!")
        tryCount = 0
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        sliderValueLabel.text = "15"
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        tryCountLabel.text = "0 / 5"
    }
}

