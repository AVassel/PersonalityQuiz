//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Anton Vassel on 14.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //      Определить наиболее часто встречающееся животное
    //      Отобразить результат в соответствии с этим животным
    
    @IBOutlet weak var youAreLabel: UILabel!
    @IBOutlet weak var yourDefinitionLabel: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.hidesBackButton = true
        updateScreenInfo()
    }
    
    private func updateScreenInfo() {
        var animalsInAnswers: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalCount = animalsInAnswers[animal] {
                animalsInAnswers.updateValue(animalCount + 1, forKey: animal)
            } else {
                animalsInAnswers[animal] = 1
            }
        }
        
        let finalAnimalList = animalsInAnswers.sorted { $0.value > $1.value }
        guard let resultAnimal = finalAnimalList.first?.key else { return }
        
        youAreLabel.text = "Вы - \(resultAnimal.rawValue)"
        yourDefinitionLabel.text = resultAnimal.definition
    }
}
