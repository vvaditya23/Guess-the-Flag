//
//  ViewController.swift
//  Guess the Flag
//
//  Created by ヴィヤヴャハレ・アディティア on 23/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    //used to embed navigation controller
    let myVC = UIViewController()
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "ABC"
        navigationController?.navigationBar.tintColor = .black
        let navCon = UINavigationController(rootViewController: myVC)
        //        present(navCon, animated: true)
        
        view.backgroundColor = .white
        setConstraints()
        askQuestion()
        setBorders()
    }
}

//MARK: set constraints
extension ViewController {
    func setConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Button 1", for: .normal)
        //        button1.backgroundColor = UIColor.blue
        view.addSubview(button1)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Button 2", for: .normal)
        //        button2.backgroundColor = UIColor.red
        view.addSubview(button2)
        
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.setTitle("Button 3", for: .normal)
        //        button3.backgroundColor = UIColor.green
        view.addSubview(button3)
        
        // Set the width and height constraints for all three buttons
        [button1, button2, button3].forEach { button in
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        // Position the buttons one below another
        //                button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20).isActive = true
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func setBorders() {
        button1.layer.borderColor = UIColor.darkGray.cgColor
        button1.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.darkGray.cgColor
        button2.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.darkGray.cgColor
        button3.layer.borderWidth = 1
    }
}
