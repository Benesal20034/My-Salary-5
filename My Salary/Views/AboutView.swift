//
//  AboutView.swift
//  My Salary
//
//  Created by Ben.issa on 8/2/2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("برنامج راتبي")
                    .foregroundColor(.green)
                Text("هو برنامج حساب تقريبي للراتب لمستخدمي شركة الخليج العربي. و هو ايضا برنامج غير رسمي من الشركة")
                    .multilineTextAlignment(.center)
            } // VStack
            .padding()
            .navigationTitle("حول البرنامج")
        } // NavigationView
    }
}

#Preview {
    AboutView()
}
