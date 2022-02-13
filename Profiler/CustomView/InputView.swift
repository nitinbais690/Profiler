//
//  InputView.swift
//  Profiler
//
//  Created by mac on 01/01/18.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            .frame(height: 45)
            .padding([.horizontal], 10)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
            .padding(.bottom, 20)
    }
}

struct InputView: View {
    @Binding var text : String;
    let placeholder: String;
    let isSecureEntry: Bool;
    let isError : Bool;
    let errorMessage: String;
    
    var body: some View {
        ZStack {
            if self.isSecureEntry {
                SecureField(placeholder, text:$text)
                    .textFieldStyle(OvalTextFieldStyle())
            } else {
                TextField(placeholder, text:$text)
                    .textFieldStyle(OvalTextFieldStyle())
                    
            }
            if isError {
              Text(errorMessage)
                .font(.caption2)
                .foregroundColor(.red)
                .padding(.horizontal, 5)
                .padding(.top, 40)
                .frame(maxWidth: .infinity ,alignment: .leading)
            }
        }
        .frame(height: 55)
    }
}


