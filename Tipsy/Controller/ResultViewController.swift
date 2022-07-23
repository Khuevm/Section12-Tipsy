//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Khue on 23/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Variants
    var result = 0.0
    var percentTip = 0
    var numberPeople = 0

    // MARK: - IBOutlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var detailInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(format: "%.2f", result)
        detailInformationLabel.text = "Split between \(numberPeople) people, with \(percentTip)% tip."
    }
    
    // MARK: - IBAction
    @IBAction func recalculateButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
