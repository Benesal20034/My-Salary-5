//
//  CalculationView.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

struct CalculationView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                TextFieldsAndButtonView()
            }
                .navigationTitle("بيانات الراتب")
        }
    }
}

#Preview {
    CalculationView()
}
