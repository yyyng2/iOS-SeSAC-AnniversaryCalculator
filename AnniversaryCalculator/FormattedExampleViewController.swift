//
//  FormattedViewController.swift
//  AnniversaryCalculator
//
//  Created by Y on 2022/07/14.
//

import UIKit

class FormattedViewController: UIViewController {

    @IBOutlet var dateLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceDateFormatter()

    }
    
    func practiceDateFormatter(){
        
        let pDF = DateFormatter()
        pDF.locale = Locale(identifier: "en_US")
        pDF.dateFormat = "MM dd yyyy"
        let currentDate = Date()
        
        dateLabel[0].text = Date().addingTimeInterval(60*60*24*100).formatted(date: .complete, time: .shortened)
        dateLabel[1].text = Date().addingTimeInterval(3600*24*200).formatted(date: .long, time: .omitted)
        dateLabel[2].text = Date().addingTimeInterval(3600*24*300).formatted(date: .numeric, time: .standard)
        
        
        
        
        
        
        let locale = Locale(identifier: "en_US")
        let currentLocale = currentDate.formatted(.dateTime.locale(locale).day().month(.twoDigits).year())
        print(currentLocale)
        let currentLocale2 = currentDate.formatted(.dateTime.locale(locale).day(.ordinalOfDayInMonth).month(.defaultDigits).year())
        dateLabel[3].text = currentLocale
        dateLabel[4].text = currentLocale2
    }



}
