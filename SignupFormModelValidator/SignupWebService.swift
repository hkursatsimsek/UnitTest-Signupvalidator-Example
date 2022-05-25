//
//  SignupWebService.swift
//  SignupFormModelValidator
//
//  Created by Kürşat Şimşek on 23.04.2022.
//

import Foundation

class SignupWebService {
    private var urlSession: URLSession
    
    private var urlString: String
    
    init (urlString: String,urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler : @escaping (SignupResponseModel?,
     SignupErrors?) -> Void) {
        guard let url = URL(string: urlString) else { 
            // TODO: Create a unit test to test that a specific error message is returned is URL is nil 
            return 
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // TODO: Write a new unit test to handle and error here
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                let fakeModel = SignupResponseModel(status: "ok")
                completionHandler(fakeModel, nil)
            } else {
                // TODO: Create a new Unit Test to handle an error here
            }
        }
        
        dataTask.resume()
    }
}
