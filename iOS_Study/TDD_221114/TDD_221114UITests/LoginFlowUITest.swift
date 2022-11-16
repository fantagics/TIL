//
//  LoginFlowUITest.swift
//  TDD_221114UITests
//
//  Created by 이태형 on 2022/11/16.
//

import XCTest

final class LoginFlowUITest: XCTestCase {
    
//    var validator: LoginValidator!
    private var app: XCUIApplication!
    private var idTextField: XCUIElement!
    private var pwTextField: XCUIElement!
    private var loginButton: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        idTextField = app.textFields["idTextField"]
        pwTextField = app.textFields["pwTextField"]
        loginButton = app.buttons["loginButton"]
    }
    override func tearDownWithError() throws {
    }
    
    func testLoginSuccess() throws{
        let app = XCUIApplication()
        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("Admin")
        app.textFields["pwTextField"].tap()
        app.textFields["pwTextField"].typeText("Admin")
        loginButton.tap()
    }
}
