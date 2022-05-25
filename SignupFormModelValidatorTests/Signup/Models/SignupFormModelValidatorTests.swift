//
//  SignupFormModelValidatorTests.swift
//  SignupFormModelValidatorTests
//
//  Created by Kürşat Şimşek on 12.04.2022.
//

import XCTest
@testable import SignupFormModelValidator

class SignupFormModelValidatorTests: XCTestCase {
    
    var systemUnderTest:SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        systemUnderTest = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
//        Birden fazla test olduğunda nesneyi serbest bırakmamız gerekir. Aksi takdirde kaynak tüketimi artar ve performans düşer.
        systemUnderTest = nil
    }

    func testSignupFormValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange => Gerekli tüm değişkenleri ve nesneleri hazırladığımız adım.
//        let systemUnderTest = SignupFormModelValidator()
        
        // Act => Test edilen method çağırılır ve bir değer döndürülür.
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName:"Kürşat")
        
        // Assert => Sistemin test altında ürettiği sonucu verir.
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returne TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
//        Değişken Kod tekrarını önlemek için class seviyesine taşındı.
//        let systemUnderTest = SignupFormModelValidator()
        
        // Act
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName: "K")
        
        // Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormValidator_WhenToLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isFirstNameValid = systemUnderTest.isFirstNameValid(firstName: "KürşatKürşat")
        
        // Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() sholud have returned FALSE but for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but is has returned TRUE")
    }
    
    func testSignupFormValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        // Act
        let doPasswordMatch = systemUnderTest.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordMatch, "The doPasswordMAtch() should have returned TRUE for matching passwords but it has returned FALSE")
        print("TEST ICIN")
        print("GitHub Hook Testi")
    }
    
    func testSignupFormValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordMatch = systemUnderTest.doPasswordMatch(password: "123456", repeatPassword: "12345678")
        
        //Assert
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatchh() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }

}
