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
    @IBOutlet weak var refresdBtnOut: UIButton!
    var indicator = UIActivityIndicatorView()
    
    
    // for localization
    @IBOutlet weak var titleOut: UILabel!
    @IBOutlet weak var contOut: UILabel!
    @IBOutlet weak var recOut: UILabel!
    @IBOutlet weak var deOut: UILabel!
    @IBOutlet weak var dateUpdateOut: UILabel!
    
    
    
// Инициализируем Presenter в этом View
    
    var presenter: MainViewPresetnterProtocol!
   
    /*
     @IBOutlet var buttonTap: UIButton!
     var indicator = UIActivityIndicatorView()

     @IBAction func buttonTap(_ sender: AnyObject) {
         buttonTap.setTitle("", for: .normal)
         indicator.center = buttonTap.center
         indicator.color = UIColor.black
         indicator.startAnimating()
     }
     */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Для локализации XibFile
        titleOut.text = "Final COVID-19 statistics in Russia"
        contOut.text = "Confirmed"
        casesOut.text = "Data loading..."
        recOut.text = "Recovered"
        recoveredOut.text = "Data loading..."
        deOut.text = "Deaths"
        deathsOut.text = "Data loading..."
        dateUpdateOut.text = "Datа updated"
        dateOut.text = "Data loading...k"
        
        
        
        
        refresdBtnOut.alpha = 0.5
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        print("did appear")
    }
    @IBAction func refreshBtn(_ sender: Any) {
        presenter.getCurrentCovData()
        refresdBtnOut.alpha = 0.5
        refresdBtnOut.isEnabled = false
        
    }
    
}



extension MainViewController: MainViewProtocol {
    func success() {
        
        // заполняем нужные оутлеты данными
        let customStrDate = getCustomStringDate()
        casesOut.text = String(describing: presenter.countryData![0].confirmed)
        dateOut.text = customStrDate
        recoveredOut.text = String(describing: presenter.countryData![0].recovered)
        deathsOut.text = String(describing: presenter.countryData![0].deaths)
        refresdBtnOut.alpha = 1.0
        refresdBtnOut.isEnabled = true
    }
  
    
    // Получаем строковую дату в нужном формате
    func getCustomStringDate() -> String {
      // MARK: Получаем дату из строки
        
        // Обьявляем переменную в которой будет лежать строковое значение даты
        let isoDate = presenter.countryData![0].lastUpdate

        // Объявляем DateFormatter и указывем его настройки
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = .autoupdatingCurrent
        // Объявляем переменную даты и получаем ее уже при помощи настроенного форматера
        let date = dateFormatter.date(from:isoDate)!
        
        //  потом создаем новый форматтер для того чтобы перевести в нужный стровый формат и настраиваем его
        let shortFormat = DateFormatter()
        shortFormat.dateFormat = "dd-MM  HH:mm"
        
        // переводим полученную дату в нужный строковый формат  при помощи нового форматтера
        let dateWithMyStyle = shortFormat.string(from: date)
        
        return dateWithMyStyle
    }
    
    func failure(error: Error) {
        
        // В случае ошибки фигачим алерт
//        let alert = UIAlertController(title: "Error", message: "Can't load data", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
//            self.refresdBtnOut.alpha = 1.0
//            self.refresdBtnOut.isEnabled = true
//        }))
//        self.present(alert, animated:  true, completion: nil)
        refresdBtnOut.alpha = 1.0
        refresdBtnOut.isEnabled = true
    }
    
    
}
