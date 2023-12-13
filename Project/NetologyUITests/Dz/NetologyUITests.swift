//
//  Created by Netology.
//

import XCTest

var login = "Saryan"

var login1 = "Sergei"

let passwords = "12SqBA1538"

class NetologyUITests: XCTestCase {
    

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(login)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(passwords)

        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()

        let predicate = NSPredicate(format: "label CONTAINS[c] %@", login)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)

                let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    func testInactiveButton() throws {
        let app = XCUIApplication()
        app.launch()

        var loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(login)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(passwords)
        
        loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("УдаляемТекст")
        loginTextField.doubleTap()
            app.keys["delete"].tap()
        
        let loginButton = app.buttons["login"]
        XCTAssertFalse(loginButton.isEnabled)
        Thread.sleep(forTimeInterval: 2)
//
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    func testLogInAgain() throws {
        let app = XCUIApplication()
        app.launch()

        var loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(login)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(passwords)

        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()
    
        app.navigationBars["Profile"].buttons["Login"].tap()
        
        loginTextField = app.textFields["login"]
        loginTextField.doubleTap()
        loginTextField.typeText("УдаляемТекст")
        loginTextField.doubleTap()
            app.keys["delete"].tap()
        loginTextField.typeText(login1)
        
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", login)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)
        
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
            
    }
}
