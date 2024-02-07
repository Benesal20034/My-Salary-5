//
//  SalaryResultView.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

struct SalaryResultView: View {
    
    @EnvironmentObject  var salaryResult : SalaryViewModel
    @Environment(\.dismiss) var close
    
    var body: some View {
        
        NavigationStack{
           
            ScrollView {
                
                VStack(spacing: 10){
                    Section {
                        ForEach(salaryResult.Entitlement) { name in
                            HStack{
                                Text(name.names)
                                    .font(.headline)
                                Spacer()
                                
                                VStack(spacing: nil){
                                    Text("\(String(format: "%.2f", name.valu))")
                                        .font(.headline)
                                        .foregroundColor(Color(uiColor: .systemGreen))
                                    Text("دينار")
                                        .font(.caption)
                                        .foregroundColor(Color(uiColor: .systemGray))
                                } // VS
                            } // HS
                            
                            Divider()
                        } // for each
                    } header: {
                        Text("الاستحقاق")
                            .font(.headline)
                            .fontWeight(.bold)

                    }
                    
                    Spacer()
                    
                    Section {
                        ForEach(salaryResult.Deductions) { name in
                            HStack{
                                Text(name.names)
                                    .font(.headline)
                                Spacer()
                               
                                VStack(spacing: nil){
                                    Text("\(String(format: "%.2f", name.valu))")
                                        .font(.headline)
                                        .foregroundColor(Color(uiColor: .systemRed))
                                    Text("دينار")
                                        .font(.caption)
                                        .foregroundColor(Color(uiColor: .systemGray))
                                } // VS
                            } // HS
                            Divider()
                            
                        } // for each
                    } header: {
                        Text("الاستقطاعات")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
                  
                }
            //.scrollDisabled(false)
            .scrollIndicators(.hidden)
            .padding()
            .navigationTitle("صافي المرتب \(String(format: "%.2f", salaryResult.NetSalary))")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("إغلاق") {
                        close.callAsFunction()
                    }
                }
            }
        }
    }
}

#Preview {
    SalaryResultView()
        .environmentObject(SalaryViewModel())
}
