//
//  ModuleBuilder.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit


protocol ViewBuilder {
    static func createMain() -> UIViewController
}


class Builder: ViewBuilder {
    //   Создаем функцию которая будет инициализировать и возвращать новый View
    static func createMain() -> UIViewController {
        // service
        let networkService = NetworkService()
        
        // обозначаем вью
        let view = MainViewController()
        // обозначаем презентер
        
        let presenter = MainPresenter(view: view, networkService: networkService)
        // инициализируем презентер во вью
        view.presenter = presenter
        // возрващаем вью
        return view
    }
    
    
}
