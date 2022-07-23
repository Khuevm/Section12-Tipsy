//
//  TipViewController.swift
//  Tipsy
//
//  Created by Khue on 23/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // MARK: - Variant
    var tipBrain = TipBrain()
    var total = 0.0
    var percent = 10
    var numberPeople = 2
    
    // MARK: - IBOutlet
    @IBOutlet weak var enterTotalLabel: UILabel!
    @IBOutlet weak var numberPeopleLabel: UILabel!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var totalTipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard when tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    @IBAction func percentButtonDidTap(_ sender: UIButton) {
        zeroPercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        
        sender.isSelected = true
        
        //Get percent
        let percentTitle = sender.title(for: .normal)!
        percent = Int(percentTitle.prefix(percentTitle.count-1)) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberPeople = Int(sender.value)
        numberPeopleLabel.text = String(numberPeople)
    }
    
    @IBAction func calculateButtonDidTap(_ sender: Any) {
        //Kiem tra user nhap so
        if let safeTotal = Double(totalTipTextField.text!) {
            total = safeTotal
            tipBrain.calculateTipResult(total: total, percentTip: Double(percent), numberPeople: Double(numberPeople))
            
            goToResult()
            
        } else {
            showAlert()
        }
    }
    
    
    func goToResult(){
        //Navigate multi-screen by code
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let resultVC = storyboard.instantiateViewController(identifier: "ResultView") as ResultViewController
        resultVC.modalPresentationStyle = .fullScreen
        
        resultVC.result = tipBrain.getTipResult()
        resultVC.numberPeople = numberPeople
        resultVC.percentTip = percent
        
        self.present(resultVC, animated: true, completion: nil)
        
    }
    
    func showAlert(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let alertVC = storyboard.instantiateViewController(identifier: "AlertView") as NotificationViewController
        
        alertVC.modalPresentationStyle = .overFullScreen
        self.present(alertVC, animated: false, completion: nil)
        
    }
    
}
