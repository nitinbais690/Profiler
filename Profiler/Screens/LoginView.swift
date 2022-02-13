//
//  LoginView.swift
//  Profiler
//
//  Created by mac on 31/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = "eve.holt@reqres.in";
    @State private var password: String = "cityslicka";
    @State private var isEmailValidate: Bool = true;
    @State private var isPasswordValid: Bool = true;
    
    @EnvironmentObject var auth: AuthModal
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            VStack{
                Image("rs")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 30)
                
                InputView(text: $email, placeholder: "Email", isSecureEntry: false, isError: !self.isEmailValidate, errorMessage: "Email is invalid")
                InputView(text: $password, placeholder: "Password", isSecureEntry: true, isError: !self.isPasswordValid, errorMessage: "Password must be greater than 6")
                
                if (auth.isError) {
                    Text(auth.errorMessage).foregroundColor(.red)
                }
                
                Spacer()
                ButtonView(isLoading: auth.isLoading, title: "Login", action: handleSubmit)
                Spacer()
        
            }.frame(maxWidth: .infinity, maxHeight:.infinity,  alignment: .top)
            .padding(15)
        }
    }
    
    
    
    func handleSubmit () {
        if(textFieldValidatorEmail(self.email) && textFieldValidatorPassword(self.password)){
            self.isPasswordValid = true
            self.isEmailValidate=true
            auth.onLogin(email: self.email, password: self.password)
        }else{
            if(!textFieldValidatorEmail(self.email)){
                self.isEmailValidate=false
            }
            if(!textFieldValidatorEmail(self.password)){
                self.isPasswordValid = false
            }
        }
    }
}

