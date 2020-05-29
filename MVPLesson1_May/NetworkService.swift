//
//  NetworkService.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation


protocol NetworkServiceProtocol {
     func getCurrentCovData(completion: @escaping (Result<[CountryData]?, Error>) -> Void)
   // func getComments( completion: @escaping (Result<[Comment]?, Error>) -> Void)
}


class NetworkService: NetworkServiceProtocol {
//    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
//        // Для того чтобы загрузить данные из интерента нам нужна ссылка
//        let urlString = "https://jsonplaceholder.typicode.com/comments"
//        // далее из строковой ссылки надо создать  URL, если ссылка битая то срабатывает Return
//        guard let url = URL(string: urlString) else {return}
//
//        // Далее открывем URL session
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            do {
//                let obj = try JSONDecoder().decode([Comment].self, from: data!)
//                completion(.success(obj))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
    
    func getCurrentCovData(completion: @escaping (Result<[CountryData]?, Error>) -> Void)  {
    
           let headers = [
                "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
                "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"
            ]

            let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-data.p.rapidapi.com/country?format=json&name=Russia")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                   // print(error)
                    
                } else {
                  //  let httpResponse = response as? HTTPURLResponse
          
                   // print("data: \(data)")
                    do {
                        let getDecodeData = try JSONDecoder().decode([CountryData].self, from: data!)
                        print("bla bla \(getDecodeData[0])")
                        DispatchQueue.main.async {
                            completion(.success(getDecodeData))
//                            self.casesOut.text = String(getDecodeData[0].confirmed)
//                            self.recoveredOut.text = String(getDecodeData[0].recovered)
//                            self.deathsOut.text = String(getDecodeData[0].deaths)
                        }
                        
                    } catch let error {
                     print(error)
                        completion(.failure(error))
                    }
                   
                }
            })

            dataTask.resume()


    }
    
}
