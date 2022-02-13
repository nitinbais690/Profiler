//
//  Helpers.swift
//  Profiler
//
//  Created by mac on 31/01/22.
//

import Foundation


struct ErrorResponse: Codable {
    let error: String
}

struct SuccessResponse: Decodable {
    let token: String;
}

func textFieldValidatorPassword(_ password: String)-> Bool{
    if(password.count>6){
       return true
    }else{
        return false
    }
}

func textFieldValidatorEmail(_ email: String)-> Bool{
    if email.count>100 {
        return false
    }
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
    
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
           return emailPredicate.evaluate(with: email)
}
