//
//  ButtonView.swift
//  Profiler
//
//  Created by mac on 01/01/18.
//

import SwiftUI

struct PurpleButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .font(.headline)
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        .background(RoundedRectangle(cornerRadius: 15).stroke().background(configuration.isPressed ? Color.purple.opacity(0.5) : Color.purple))
                        .cornerRadius(15)
  }
}

struct ButtonView: View {
    let isLoading: Bool;
    let title: String;
    let action: () -> Void
    
    var body: some View {
        if isLoading {
            ProgressView()
             .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(width: 300, height: 50)
                .background(RoundedRectangle(cornerRadius: 15).stroke().background(Color.purple))
                                .cornerRadius(10)
        }else {
            Button(title,action: self.action)
                .buttonStyle(PurpleButtonStyle())
        }
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(isLoading: false, title: "Test", action: {
            print("Testing")
        });
    }
}
