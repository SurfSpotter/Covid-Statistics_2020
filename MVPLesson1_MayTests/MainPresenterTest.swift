//
//  MainPresenterTest.swift
//  MVPLesson1_MayTests
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import XCTest
@testable import MVPLesson1_May


// создаем фейковую вьюху
class MockView: MainViewProtocol {
    var title : String?
    func setGreeting(greeting: String) {
        self.title = greeting
    }
    
    
}
// создаем класс презентера в тесте
class MainPresenterTest: XCTestCase {
    
    // объявляем ему переменные
    var view : MockView!
    var person : Person!
    var presenter : MainPresenter!

    
    // эта функция срабатывает при запуске теста
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    // при завершении теста  все переменные ставим nil
    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    // проверяем создались ли эти переменные
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    
    func testMockView() {
        presenter.showGreeting()
        XCTAssertEqual(view.title, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
        
        
    }

}
