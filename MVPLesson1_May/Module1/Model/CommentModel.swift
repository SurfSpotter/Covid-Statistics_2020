//
//  Person.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//


// Это модель данных, у нее есть структура которая содержит две переменные : FirstName LastName , эти переменные в далнейшем передаются презентеру который потом их отправляет View

import Foundation



//  объявляем структуру для парсинга
struct Comment: Decodable {
    var postId: Int
    var name : String
    var email : String
    var body : String
}

