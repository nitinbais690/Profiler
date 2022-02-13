//
//  AuthModal.swift
//  Profiler
//
//  Created by mac on 31/01/22.
//

import SwiftUI


class AuthModal : ObservableObject {
    @Published var isLogin: Bool = false;
    @Published var userToken: String = "";
    @Published var isError: Bool = false;
    @Published var errorMessage: String = "";
    @Published var isLoading: Bool = false;
    
    
    init() {
        let str = UserDefaults.string("userToken") as! String;
        if str.count > 0 {
            self.isLogin = true;
            self.userToken = str;
        }
    }
    
    func onLogin(email: String, password: String){
        
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        
        let body: [String: String] = ["email": email,"password": password];
        let requestBody = try! JSONSerialization.data(withJSONObject: body);
        
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        request.httpBody = requestBody;
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        self.isLoading = true;
        
        URLSession.shared.dataTask(with: request){ (data, result, error) in
            guard let data = data else { return }
            print(data)
            guard let successResponse = try? JSONDecoder().decode(SuccessResponse.self,from: data) else {
                guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self,from: data)else{
                    return
                }
                DispatchQueue.main.async {
                    self.isError = true
                    self.errorMessage = errorResponse.error
                    self.isLoading = false
                }
                return
            }
            
            DispatchQueue.main.async {
                self.userToken = successResponse.token;
                self.isLogin = true
                self.errorMessage = "";
                self.isLoading = false;
                self.isError = false
                
                UserDefaults.standard.set(successResponse.token, forKey: "userToken")
            }
        
        }.resume()
    }
}
