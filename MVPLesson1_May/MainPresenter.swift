//
//  MainPresenter.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

//   Это протокол для View, он содержит фукцию которая устанавливает строковое значение
protocol MainViewProtocol : class {
    func setGreeting(greeting: String)
}


// Это протокол для презентера,  в нем есть обязательный инициализатор который принимает данные от модели и закидывет их в свою переменную(let person: Person), то есть в инициализаторе указывется модель данных.
// Также он должен принимать какую либо View, которая подписана на протокол содержащий функцию передачи строкового значения
// Он должен содежать в себе функцию SetGreeting для обработки и отправки ее на View
// В этой функции как раз прослеживается абстрактная связь между моделью данных и View

protocol MainViewPresetnterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}


class MainPresenter: MainViewPresetnterProtocol {
   
    
    let view : MainViewProtocol
    let person: Person
    
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
       }
   
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        view.setGreeting(greeting: greeting)
    }
    
}
