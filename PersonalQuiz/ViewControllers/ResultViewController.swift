//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    private var animals: [Animal] = []
    private var dogCount = 0
    private var rabbitCount = 0
    private var turtleCount = 0
    private var catCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        getChosenAnswer()
        settingLabels()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
}
private extension ResultViewController {
    
    func getChosenAnswer() {
        for answer in answersChosen {
            animals.append(answer.animal)
        }
        
        for animal in animals {
            if animal == Animal.cat {
                catCount += 1
            } else if animal == Animal.dog {
                dogCount += 1
            } else if animal == Animal.turtle {
                turtleCount += 1
            } else if animal == Animal.rabbit {
                rabbitCount += 1
            }
        }
        
    }
    
    func settingLabels() {
        let counts = [catCount, dogCount, turtleCount, rabbitCount]
        let highestValue = counts.max()
        
        if  dogCount == highestValue {
            resultLabel.text = "Вы - \(Animal.dog.rawValue)"
            definitionLabel.text = Animal.dog.definition
        } else if catCount == highestValue {
            resultLabel.text = "Вы - \(Animal.cat.rawValue)"
            definitionLabel.text = Animal.cat.definition
        } else if rabbitCount == highestValue {
            resultLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            definitionLabel.text = Animal.rabbit.definition
        } else if turtleCount == highestValue {
            resultLabel.text = "Вы - \(Animal.turtle.rawValue)"
            definitionLabel.text = Animal.turtle.definition
        }
    }
}



