//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by Y on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var daysOutletCollection: [UILabel]!
    @IBOutlet weak var years100Label: UILabel!
    @IBOutlet weak var date100Label: UILabel!
    @IBOutlet weak var years200Label: UILabel!
    @IBOutlet weak var date200Label: UILabel!
    @IBOutlet weak var years300Label: UILabel!
    @IBOutlet weak var date300Label: UILabel!
    @IBOutlet weak var years365Label: UILabel!
    @IBOutlet weak var date365Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = Locale(identifier: "en_US")
        designLabel()
        
     
    }
    
 

    @IBAction func datePickerSelected(_ sender: UIDatePicker) {
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "en_US")
        dateFormmater.dateFormat = "MM dd yyyy"
        dateCalculator()
        designLabel()
    }
    
    func designLabel(){
        for label in daysOutletCollection{
            label.textColor = .red
            label.shadowColor = .magenta
            label.textAlignment = .center
        
        
        }
    }
  
    func dateCalculator(){
        let day100 = DateComponents(day: 99)
        let calendar = Calendar.current
        let d100 = calendar.date(byAdding: day100, to: datePicker.date)
        let year100formatter = DateFormatter()
        let day100formatter = DateFormatter()
        year100formatter.dateFormat = "yyyy"
        day100formatter.dateFormat = "MM. dd."
        years100Label.text = year100formatter.string(from: (d100!))
        date100Label.text = day100formatter.string(from: d100!)
        
        let day200 =
        DateComponents(day:199)
        let d200 = calendar.date(byAdding: day200, to: datePicker.date)
        let year200formatter = DateFormatter()
        let day200formatter = DateFormatter()
        year200formatter.dateFormat = "yyyy"
        day200formatter.dateFormat = "MM. dd."
        years200Label.text = year200formatter.string(from: d200!)
        date200Label.text = day200formatter.string(from: d200!)
        
        let day300 = DateComponents(day:299)
        let d300 = calendar.date(byAdding: day300, to: datePicker.date)
        let year300formatter = DateFormatter()
        let day300formatter = DateFormatter()
        year300formatter.dateFormat = "yyyy"
        day300formatter.dateFormat = "MM. dd."
        years300Label.text = year300formatter.string(from: d300!)
        date300Label.text = day300formatter.string(from: d300!)
        
        let day365 = DateComponents(day:364)
        let d365 = calendar.date(byAdding: day365, to: datePicker.date)
        let year365formatter = DateFormatter()
        let day365formatter = DateFormatter()
        year365formatter.dateFormat = "yyyy"
        day365formatter.dateFormat = "MM. dd."
        years365Label.text = year365formatter.string(from: d365!)
        date365Label.text = day365formatter.string(from: d365!)
        
        
    }
    
    
    
}

