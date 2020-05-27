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
    func success()
    func failure(error: Error)
}


// Это протокол для презентера,  в нем есть обязательный инициализатор который принимает данные от модели и закидывет их в свою переменную(let person: Person), то есть в инициализаторе указывется модель данных.
// Также он должен принимать какую либо View, которая подписана на протокол содержащий функцию передачи строкового значения
// В этой функции как раз прослеживается абстрактная связь между моделью данных и View







protocol MainViewPresetnterProtocol: class {
    // инициализатор
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    // функция получения комментариев
    func getComments()
    // переменная хранения массива комментариев
    var comments: [Comment]? { get set}
}

// Протокол Presetnter

class MainPresenter: MainViewPresetnterProtocol {
    weak var view: MainViewProtocol?
    var networkService: NetworkServiceProtocol!
    var comments : [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
       
    }
    
    // Здесь же вызываем функцию получения комментариев
           
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
    
    
}
