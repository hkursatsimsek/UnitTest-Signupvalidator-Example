//
//  SignupFormModelValidator.swift
//  SignupFormModelValidator
//
//  Created by Kürşat Şimşek on 12.04.2022.
//

import Foundation

class SignupFormModelValidator {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
//        if firstName.isEmpty {
//            returnValue = false
//        }
        
//        if firstName.count < 2 {
//            returnValue = false
//        }
        
        let count = firstName.count
        
        if count < SignupConstants.firstNameMinLength || count > SignupConstants.firstNameMaxLength {
            returnValue =  false 
        }
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
//        var returnValue = true
//        
//        if password != repeatPassword {
//            returnValue = false
//        }
//        
//        return returnValue
        
        return password != repeatPassword
    }
}
