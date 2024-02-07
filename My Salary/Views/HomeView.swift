//
//  HomeView.swift
//  My Salary
//
//  Created by Ben.issa on 7/2/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            
            CalculationView()
                .tabItem {
                    Image(systemName: "chart.bar.doc.horizontal")
                    Text("حساب الراتب")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "exclamationmark.circle")
                    Text("حول البرنامج")
                }
        }
    }
}

#Preview {
    HomeView()
}
