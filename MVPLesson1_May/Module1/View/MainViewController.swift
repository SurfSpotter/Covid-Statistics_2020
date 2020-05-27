//
//  ViewController.swift
//  MVPLesson1_May
//
//  Created by Алексей Чигарских on 27.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


 // Добавляем текстЛэйбл на View
    @IBOutlet weak var greetingLabel : UILabel!
    
    
// Инициализируем Presenter в этом View
    
    var presenter: MainViewPresetnterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// Добавляем кнопку по нажатию на которую отправаляются данные  с презентера

    @IBAction func didTapFunc(_ sender: Any) {
        self.presenter.showGreeting()
    }
    
}

// Это расширение подписывает вью на протокол обмена функцией Greeting


extension MainViewController: MainViewProtocol  {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
}

