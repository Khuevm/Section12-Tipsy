//
//  NotificationViewController.swift
//  Tipsy
//
//  Created by Khue on 24/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertView.layer.cornerRadius = 30
    }
    

    @IBAction func tryAgainButtonDidTap(_ sender: Any) {
        self.dismiss(animated: false)
    }
}
