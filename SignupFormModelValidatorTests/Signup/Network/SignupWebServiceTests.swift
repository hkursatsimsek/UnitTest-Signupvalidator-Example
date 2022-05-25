//
//  SignupWebServiceTests.swift
//  SignupFormModelValidatorTests
//
//  Created by Kürşat Şimşek on 23.04.2022.
//

import XCTest
@testable import SignupFormModelValidator


class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange 
//        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
//        let sut = SignupWebService(urlString: "https://ad8a073d-d2fe-4c0e-a419-b8035e910005.mock.pstmn.io/users")
        let sut = SignupWebService(urlString: "http://localhost:5858/users")
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Kürşat", lastName: "Şimşek", email: "test@test.com", password: "12345678")
        
        /*
         XCTest beklentilerinin iki bölümü vardır: expectation ve waiter.
         Expectation, daha sonra yerine getirebileceğiniz bir nesnedir.
         XCTestCase'in wait yöntemi, test yürütmesine expectation gerçekleşene veya belirli bir süre geçene kadar beklemesini söyler.
         */
        
        let expectation = self.expectation(description: "Signup Web Service Repsonse Expectation")
        // webhook push için eklendi
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error ) in
            
            //Assert
            //"{\"status\"status:\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
