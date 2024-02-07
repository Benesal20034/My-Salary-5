//
//  SalaryViewModel.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

class SalaryViewModel : ObservableObject {
    
    @Published var salaryInputData : SalaryModel = SalaryModel(basicSalary: "", numOfdayInFeild: "", numOfHolydaysHour: "", numOfNoarmalHours: "", feildbonus: "", advancepremium: "", familyNum: "", numOfyears: "", performanceIncentive: "")
    
    @Published var Entitlement : [NameAndValu] = []
    @Published var Deductions : [NameAndValu] = []
    @Published var NetSalary : Double = 0
    
    
    
    func calculatSalary(){
        
        let BasicSalary = Double(salaryInputData.basicSalary) ?? 0
        let NumOfdayInFeild = Double(salaryInputData.numOfdayInFeild) ?? 0
        let NumOfHolydaysHour = Double(salaryInputData.numOfHolydaysHour) ?? 0
        let NumOfNoarmalHours = Double(salaryInputData.numOfNoarmalHours) ?? 0
        let Feildbonus = Double(salaryInputData.feildbonus) ?? 0
        let Advancepremium = Double(salaryInputData.advancepremium) ?? 0
        let FamilyNum = Double(salaryInputData.familyNum) ?? 0
//        let NumOfyears = Double(salaryInputData.numOfyears) ?? 0
        let PerformanceIncentive = Double(salaryInputData.performanceIncentive) ?? 0

        // العلاوة الحقلية
        let fieldbonus = NumOfdayInFeild * Feildbonus
        
        // قيمة الساعة
        let hourValue = ( BasicSalary + fieldbonus ) * 12/1950
        
        // قيمة الساعة العادية
        let normalHourValue = hourValue * NumOfNoarmalHours * 1.5
        
        // قيمة ساعة العطل
        let holydayHourVale = hourValue * NumOfHolydaysHour * 2
        
        // العمل الاضافي
        let overtime = normalHourValue + holydayHourVale
        
        // الضمان الاجتماعي
        let socialSecurity = (BasicSalary + overtime + fieldbonus + PerformanceIncentive ) * (5.125/100)
        
        // التضامن الاجتماعي
        let socialSolidarity = (BasicSalary + overtime + fieldbonus + PerformanceIncentive ) * (1/100)
        
        // ضريبة الجهاد
        let jihadTax = (BasicSalary + overtime + fieldbonus + PerformanceIncentive - socialSecurity - socialSolidarity) * 3/100
        
        // ضريبة الدخل
        //      الاعفاء
        var exemption : Double = 0
        if FamilyNum < 2 {
            exemption = 150.0
        } else if FamilyNum == 2 {
            exemption = 200.0
        } else  {
            exemption = Double(150 + FamilyNum * 25)
        }
        //        المرتب
        let salary = BasicSalary + fieldbonus + overtime + PerformanceIncentive - socialSecurity - socialSolidarity
        
        //         الوعاء الضريبي
        let taxBase = salary - exemption
        
        // ضريبة 5%
        var tax1 : Double = 0
        if taxBase <= 1000 {
            tax1 = taxBase
        } else {
            tax1 = 1000.0
        }
        
        var tax2 : Double = 0
        if tax1 > 0 {
            tax2 = tax1
        } else {
            tax2 = 0.0
        }
        
        let tax5 = tax2 * 0.050
        
        //        ضريبة 10%
        
        let tax3 = taxBase - 1000.0
        var tax4 : Double = 0
        if tax3 > 0.0 {
            tax4 = tax3
        } else {
            tax4 = 0.0
        }
        
        let tax10 = tax4 * 0.100
        
        //        ضريبة الدخل
        let incomeTax = tax5 + tax10
        
        //            اجمالي الخصومات
        let totalDiscount = socialSecurity + socialSolidarity + jihadTax + incomeTax
        
        let netSalary = BasicSalary + fieldbonus + overtime - ( Advancepremium + totalDiscount )  + PerformanceIncentive
        
        // صافي المرتب
        self.NetSalary = netSalary
        
        // الاستحقاقات
        self.Entitlement = [
            NameAndValu(names: "العمل الاضافي", valu: overtime),
            NameAndValu(names: "قيمة الساعات العادية", valu: normalHourValue),
            NameAndValu(names: "قيمة الساعات العطل", valu: holydayHourVale),
            NameAndValu(names: "قيمة الساعة", valu: hourValue),
            NameAndValu(names: "العلاوة الحقلية", valu: fieldbonus)
        ]
        
        // الاستقطاعات
        self.Deductions = [
            NameAndValu(names: "اجمالي الخصومات", valu: totalDiscount),
            NameAndValu(names: "الضمان الاجتماعي", valu: socialSecurity),
            NameAndValu(names: "التضامن الاجتماعي", valu: socialSolidarity),
            NameAndValu(names: "ضريبة الجهاد", valu: jihadTax),
            NameAndValu(names: "ضريبة الدخل", valu: incomeTax)
        ]
    }
    
}

//func model() -> SalaryViewModel {
//    let model = SalaryViewModel()
//        let entitlement = [NameAndValu(names: "تمن", valu: 22), NameAndValu(names: "يمن", valu: 22), NameAndValu(names: "ثنم", valu: 22) ]
//        
//        let deductions = [NameAndValu(names: "صخم", valu: 22), NameAndValu(names: "ثخمن", valu: 22), NameAndValu(names: "يها", valu: 22) ]
//        
//        
//        
//        model.Entitlement.append(contentsOf: entitlement)
//    model.Deductions.append(contentsOf: deductions)
//    
//    return model
//}
