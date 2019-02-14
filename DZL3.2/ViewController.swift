//
//  ViewController.swift
//  DZL3.2
//
//  Created by Macbook on 02.02.2019.
//  Copyright © 2019 Nikolay_Romanov. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Func manhattan is work -", manhattan())
        print("Studen must have -", studentEconimic(stipend: 700, expense: 1000, inflationPercent: 3))
        print("Student living month -", studentsLiving(stipend: 700, saveMoney: 2400, expense: 1000, inflationPercent: 3))
        print("Revers number 25 -", reversNumber(number: 25))
    }
    
    // Задача 1. Остров Манхэттен был приобретен поселенцами за $24 в 1826 г. Каково было бы в настоящее время состояние их счета, если бы эти 24 доллара были помещены тогда в банк под 6% годового дохода?
    func manhattan() -> Double {
        let yearToDay = 2019
        var totalMoney: Double = 24
        for _ in 1826...yearToDay {
            totalMoney = (totalMoney * 0.06) + totalMoney
        }
        return totalMoney
    }
    
    // Задача 2. Ежемесячная стипендия студента составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, какую нужно иметь сумму денег, чтобы прожить учебный год (10 месяцев), используя только эти деньги и стипендию.
    func studentEconimic(stipend: Double, expense: Double, inflationPercent: Double) -> Double {
        let inflationNumber = inflationPercent/100 // inflation convert to %
        var stipendSum: Double = 0
        var expenseSum: Double = 0
        var sumNeed: Double = 0
        for _ in 0..<10 {
            stipendSum += stipend
            expenseSum = expense + expenseSum * inflationNumber + expenseSum
            sumNeed = expenseSum - stipendSum
        }
        return sumNeed
    }
    
    //Задача 3. У студента имеются накопления 2400 грн. Ежемесячная стипендия составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, сколько месяцев сможет прожить студент, используя только накопления и стипендию.
    func studentsLiving(stipend: Double, saveMoney: Double, expense: Double, inflationPercent: Double) -> Int {
        var allMoney: Double = saveMoney
        let inflationNumber = inflationPercent/100 // inflation convert to %
        var month = 0
        var allExpense = expense
        while (allMoney > allExpense) {
            allExpense = expense * inflationNumber + allExpense
            allMoney = allMoney - allExpense
            allMoney = allMoney + stipend
            month += 1
        }
        return month
    }
    
    //Задача 4 2хзначную цело численную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
    func reversNumber(number: Int) -> Int {
        var numberIn = number
        var iteration = 0
        while (numberIn >= 10) {
            numberIn -= 10
            iteration += 1
        }
        let reversNumber = numberIn * 10 + iteration
        return reversNumber
    }
    
}

