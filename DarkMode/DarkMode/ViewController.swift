//
//  ViewController.swift
//  DarkMode
//
//  Created by Don Manuel on 23/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let darkMode = UserDefaults.standard.bool(forKey: "darkModeEnabled")
        
        darkModeSwitch.isOn = darkMode
        
        if darkMode {
            darkModeLabel.text = "Dark mode activado"
        } else {
            darkModeLabel.text = "Dark mode desactivado"
        }
        
        darkModeSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
       
    }
    
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            darkModeLabel.text = "Dark mode activado"
            UserDefaults.standard.set(sender.isOn, forKey: "darkModeEnabled")
        } else {
            darkModeLabel.text = "Dark mode desactivado"
            UserDefaults.standard.set(sender.isOn, forKey: "darkModeEnabled")
        }
        
        // Para cambiar el modo dark
        if let appDelegate =  UIApplication.shared.windows.first {
            if sender.isOn {
                appDelegate.overrideUserInterfaceStyle = .dark
            } else {
                appDelegate.overrideUserInterfaceStyle = .light
            }
        }
    }
    

}

