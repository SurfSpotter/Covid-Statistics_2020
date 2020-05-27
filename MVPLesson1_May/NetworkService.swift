//
//  NetworkService.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation


protocol NetworkServiceProtocol {
    func getComments( completion: @escaping (Result<[Comment]?, Error>) -> Void)
}


class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        // Для того чтобы загрузить данные из интерента нам нужна ссылка
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        // далее из строковой ссылки надо создать  URL, если ссылка битая то срабатывает Return
        guard let url = URL(string: urlString) else {return}
        
        // Далее открывем URL session
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
