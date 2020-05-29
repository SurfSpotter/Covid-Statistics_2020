//
//  ViewController.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


 // не забывааем в сториборде протянуть связи от таблицы  к Owner ( DataSource, Delegate ), Иначе нихрена работать е будет!
 //   @IBOutlet weak var tableView: UITableView!
    
// MARK:- Oultets
    
    @IBOutlet weak var dateOut: UILabel!
    @IBOutlet weak var casesOut: UILabel!
    @IBOutlet weak var recoveredOut: UILabel!
    @IBOutlet weak var deathsOut: UILabel!
    
    
// Инициализируем Presenter в этом View
    
    var presenter: MainViewPresetnterProtocol!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
      
    }
   
 
}


//extension MainViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        let comment = presenter.comments?.count ?? 0
//        return comment
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let comments = presenter.comments?[indexPath.row]
//        cell.textLabel?.text = comments?.body
//        return cell
//    }
    
    
//}


extension MainViewController: MainViewProtocol {
    func success() {
        //tableView.reloadData()
        /*
         var str = "2013-07-21T19:32:00Z"

         var dateFor: NSDateFormatter = NSDateFormatter()
         dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss:SSS"

         var yourDate: NSDate? = dateFor.dateFromString(str)

         println(yourDate)
         
         "2020-05-29T09:39:06+02:00"
         */
        
        //dateForm.string(from: (presenter.countryData?[0].lastChange)!)
        
        
        // MARK: Получаем дату из строки
        
        // Обьявляем переменную в которой будет лежать строковое значение даты
        let isoDate = presenter.countryData![0].lastChange

        // Объявляем DateFormatter и указывем его настройки
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = .autoupdatingCurrent
        // Объявляем переменную даты и получаем ее уже при помощи настроенного форматера
        let date = dateFormatter.date(from:isoDate)!
        
        //  потом создаем новый форматтер для того чтобы перевести в нужный стровый формат и настраиваем его
        let shortFormat = DateFormatter()
        shortFormat.dateFormat = "dd-MM,HH:mm"
        
        // переводим полученную дату в нужный строковый формат  при помощи нового форматтера
        let dateWithMyStyle = shortFormat.string(from: date)
        
        
        
        print("dadadate:")
        print(dateWithMyStyle)
        
        
      
        
        
        casesOut.text = String(describing: presenter.countryData![0].confirmed) + " confirmed"
        dateOut.text = "Last Update: " + dateWithMyStyle
        recoveredOut.text = String(describing: presenter.countryData![0].recovered) + " recovered"
        deathsOut.text = String(describing: presenter.countryData![0].deaths) + " deaths"
    }
    
    func failure(error: Error) {
        
        // В случае ошибки фигачим алерт
        let alert = UIAlertController(title: "Error", message: "Can't load data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated:  true, completion: nil)
    }
    
    
}
