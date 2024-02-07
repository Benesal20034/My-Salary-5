//
//  TextFieldsAndButtonView.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

struct TextFieldsAndButtonView: View {
    @EnvironmentObject  var salarydata : SalaryViewModel
    
    @State var basicSalary : String = ""
    @State var numOfdayInFeild: String = ""
    @State var numOfHolydaysHour : String = ""
    @State var numOfNoarmalHours : String = ""
    @State var feildbonus : String = ""
    @State var advancepremium : String = ""
    @State var familyNum : String = ""
//    @State var numOfyears : String = ""
    @State var performanceIncentive : String = ""
    
    @State var showSalaryResult: Bool = false
    
    @FocusState var isFocusState: Bool
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        
        VStack(spacing: 30){
            
            TextField("", text: self.$basicSalary)
                .focused($focusedField, equals: .basicSalary)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "الراتب الاساسي",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.basicSalary.isEmpty
                    )
                )
            
            TextField("", text: self.$numOfdayInFeild)
                .focused($focusedField, equals: .numOfdayInFeild)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "عدد الايام في الحقل",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.numOfdayInFeild.isEmpty
                    )
                )
            
            TextField("", text: self.$numOfHolydaysHour)
                .focused($focusedField, equals: .numOfHolydaysHour)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "عدد ساعات العطل",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.numOfHolydaysHour.isEmpty
                    )
                )
            
            TextField("", text: self.$numOfNoarmalHours)
                .focused($focusedField, equals: .numOfNoarmalHours)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "عدد الساعات العادية",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.numOfNoarmalHours.isEmpty
                    )
                )
            
            TextField("", text: self.$feildbonus)
                .focused($focusedField, equals: .feildbonus)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "قيمة العلاوة الحقلية",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.feildbonus.isEmpty
                    )
                )
            
            TextField("", text: self.$performanceIncentive)
                .focused($focusedField, equals: .performanceIncentive)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "علاوة حافز الاداء",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.performanceIncentive.isEmpty
                    )
                )
            
            TextField("", text: self.$advancepremium)
                .focused($focusedField, equals: .advancepremium)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "قسط السلفة العادية",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.advancepremium.isEmpty
                    )
                )
            
            TextField("", text: self.$familyNum)
                .focused($focusedField, equals: .familyNum)
                .keyboardType(.numberPad)
                .focused($isFocusState)
                .textFieldStyle(
                    CustomTextFieldStyle(
                        placeholder: "عدد افراد الاسرة",
                        placeholderColor: Color(uiColor: .systemGreen),
                        placeholderBgColor: Color(uiColor: .systemBackground),
                        isEditing: !self.familyNum.isEmpty
                    )
                )
            
//            TextField("", text: self.$numOfyears)
//                .focused($focusedField, equals: .numOfyears)
//                .keyboardType(.numberPad)
//                .focused($isFocusState)
//                .textFieldStyle(
//                    CustomTextFieldStyle(
//                        placeholder: "عدد سنوات الخدمة",
//                        placeholderColor: Color(uiColor: .systemGreen),
//                        placeholderBgColor: Color(uiColor: .systemBackground),
//                        isEditing: !self.numOfyears.isEmpty
//                    )
//            
//                )
            
            
            
            Button {
                dataAdded()
                salarydata.calculatSalary()
                showSalaryResult.toggle()

            } label: {
                Text("احسب")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .systemGreen))
                    .cornerRadius(15)
            }

        }
        .toolbar {
            
                ToolbarItem(placement: .keyboard) {
                    HStack{
                        Button(action: focusPreviousField) {
                            Image(systemName: "chevron.up")
                            
                        }
                        .disabled(!canFocusPreviousField())
                        
                        
                        Button(action: focusNextField) {
                            Image(systemName: "chevron.down")
                           
                        }
                        .disabled(!canFocusNextField())
                        
                        Spacer()
                        
                        Button("تم") {
                            isFocusState.toggle()
                        }
                    }
                    
                }
              
        }
        .sheet(isPresented: $showSalaryResult) {
            SalaryResultView()
        }
        .padding()
        .padding(.top, 20)
    }
    
    func dataAdded(){
        salarydata.salaryInputData.basicSalary = basicSalary
        salarydata.salaryInputData.numOfdayInFeild = numOfdayInFeild
        salarydata.salaryInputData.numOfHolydaysHour = numOfHolydaysHour
        salarydata.salaryInputData.numOfNoarmalHours = numOfNoarmalHours
        salarydata.salaryInputData.feildbonus = feildbonus
        salarydata.salaryInputData.advancepremium = advancepremium
        salarydata.salaryInputData.familyNum = familyNum
//        salarydata.salaryInputData.numOfyears = numOfyears
        salarydata.salaryInputData.performanceIncentive = performanceIncentive
    }
    
}

extension TextFieldsAndButtonView {
    
    private enum Field: Int, CaseIterable {
        case basicSalary, numOfdayInFeild, numOfHolydaysHour , numOfNoarmalHours , feildbonus , performanceIncentive ,advancepremium , familyNum
    }
    
    private func focusPreviousField() {
        focusedField = focusedField.map {
            Field(rawValue: $0.rawValue - 1) ?? .familyNum
        }
    }
    
    private func focusNextField() {
        focusedField = focusedField.map {
            Field(rawValue: $0.rawValue + 1) ?? .basicSalary
        }
    }
    
    private func canFocusPreviousField() -> Bool {
        guard let currentFocusedField = focusedField else {
            return false
        }
        return currentFocusedField.rawValue > 0
    }
    
    private func canFocusNextField() -> Bool {
        guard let currentFocusedField = focusedField else {
            return false
        }
        return currentFocusedField.rawValue < Field.allCases.count - 1
    }
}





#Preview {
    TextFieldsAndButtonView()
}
