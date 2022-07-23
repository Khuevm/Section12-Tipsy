//
//  TipBrain.swift
//  Tipsy
//
//  Created by Khue on 23/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tipResult = 0.0
    
    mutating func calculateTipResult(total: Double, percentTip: Double, numberPeople: Double){
        tipResult = (total * (1 + (percentTip/100))) / numberPeople
    }
    
    func getTipResult() -> Double {
        return tipResult
    }
}
