//
//  SignupFormRequestModel.swift
//  SignupFormModelValidator
//
//  Created by Kürşat Şimşek on 23.04.2022.
//

import Foundation

struct SignupFormRequestModel: Encodable{
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
