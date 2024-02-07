//
//  SalaryModel.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

struct SalaryModel {
    
    var basicSalary : String
    var numOfdayInFeild: String
    var numOfHolydaysHour : String
    var numOfNoarmalHours : String
    var feildbonus : String
    var advancepremium : String
    var familyNum : String
    var numOfyears : String
    var performanceIncentive : String
}

struct NameAndValu: Identifiable {
    
    let id = UUID().uuidString
    let names: String
    let valu: Double
}
