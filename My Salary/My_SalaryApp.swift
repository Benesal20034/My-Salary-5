//
//  My_SalaryApp.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

@main
struct My_SalaryApp: App {
    @StateObject var salarydata : SalaryViewModel = SalaryViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
            .environmentObject(salarydata)
        }
    }
}
