//
//  ViewController.swift
//  Localization-Tutorial
//
//  Created by Aman Aggarwal on 17/08/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnChangeLangauge: UIButton!
    @IBOutlet weak var lblCurrentLanguage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblHeader.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "header_text", comment: "")
        lblCurrentLanguage.text = LocalizationSystem.sharedInstance.getLanguage()
        btnChangeLangauge.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language", comment: ""), for: .normal)
        
    }

    
    @IBAction func changeLanguage(_ sender: Any) {
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc") as! ViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

