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
    @IBOutlet weak var tableView: UITableView!
    

    
    
// Инициализируем Presenter в этом View
    
    var presenter: MainViewPresetnterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // регистрируем таблицу
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
   
    
}

// Это расширение подписывает вью на протокол обмена функцией Greeting


extension MainViewController: MainViewProtocol  {
    func setGreeting(greeting: String) {
       
    }
    
    
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "TEST"
        return cell
    }
    
    
}
