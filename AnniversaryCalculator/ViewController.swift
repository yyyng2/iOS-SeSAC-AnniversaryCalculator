//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by Y on 2022/07/13.
//

import UIKit

var userDefaults = UserDefaults.standard

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet var daysLabelCollection: [UILabel]!
    @IBOutlet weak var pickedDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDatePicker()
        designLabel()
        loadDayDate()
    }
    
    func designDatePicker(){
        datePicker.locale = Locale(identifier: "en_US")
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func designLabel(){
        for label in labelCollection{
            label.textColor = .red
            label.shadowColor = .magenta
            label.textAlignment = .center
        }
    }
    
    func loadDayDate(){
        if UserDefaults.standard.string(forKey: "save") != nil{
            let loadDate = UserDefaults.standard.string(forKey: "save")
            pickedDayLabel.text = (loadDate)!
            for tag in 0...3{
                let loadDate = UserDefaults.standard.string(forKey: "\(tag)")
                daysLabelCollection[tag].text = (loadDate)!
            }
            
        } else {
            pickedDayLabel.text = "When is the anniversary?"
            for tag in 0...3{
                daysLabelCollection[tag].text = "\(tag)"
            }
        }
    }
  
    func dateCal(_ days: Int, _ textTag: Int){
        let daysAfter = DateComponents(day: days)
        let calendar  = Calendar.current
        let plusDays = calendar.date(byAdding: daysAfter, to: datePicker.date)
        let daysFormatter = DateFormatter()
        daysFormatter.dateFormat = "yyyy. \nMM. dd."
        daysLabelCollection[textTag].text = daysFormatter.string(from: plusDays!)
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        pickedDayLabel.text = "\(datePicker.date.formatted(date: .numeric, time: .omitted))"
        dateCal(99, 0)
        dateCal(199, 1)
        dateCal(299, 2)
        dateCal(364, 3)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(pickedDayLabel.text!, forKey: "save")
        for tag in 0...3{
            UserDefaults.standard.set(daysLabelCollection[tag].text!, forKey: "\(tag)")
            }
    }
    
    
    // 함수를 만들어 간소화하기 전
    //    func dateCalculator(){
    //        let daysAfter100 = DateComponents(day: 99)
    //        let calendar = Calendar.current
    //        let dPlus100 = calendar.date(byAdding: daysAfter100, to: datePicker.date)
    //        let days100formatter = DateFormatter()
    //        days100formatter.dateFormat = "yyyy \nMM. dd."
    //        daysLabelCollection[0].text = days100formatter.string(from: (dPlus100!))
    //
    //        let daysAfter200 =
    //        DateComponents(day:199)
    //        let dPlus200 = calendar.date(byAdding: daysAfter200, to: datePicker.date)
    //        let days200formatter = DateFormatter()
    //        days200formatter.dateFormat = "yyyy \nMM. dd."
    //        daysLabelCollection[1].text = days200formatter.string(from: dPlus200!)
    //
    //        let daysAfter300 = DateComponents(day:299)
    //        let dPlus300 = calendar.date(byAdding: daysAfter300, to: datePicker.date)
    //        let days300formatter = DateFormatter()
    //        days300formatter.dateFormat = "yyyy \nMM. dd."
    //        daysLabelCollection[2].text = days300formatter.string(from: dPlus300!)
    //
    //        let daysAfter365 = DateComponents(day:364)
    //        let dPlus365 = calendar.date(byAdding: daysAfter365, to: datePicker.date)
    //        let days365formatter = DateFormatter()
    //        days365formatter.dateFormat = "yyyy \nMM. dd."
    //        daysLabelCollection[3].text = days365formatter.string(from: dPlus365!)
    //
    //
    //    }
    //
    //    @IBAction func datePickerSelected(_ sender: UIDatePicker) {
    //        let dateFormmater = DateFormatter()
    //        dateFormmater.locale = Locale(identifier: "en_US")
    //        dateFormmater.dateFormat = "MM dd yyyy"
    //        dateCalculator()
    //        designLabel()
    //    }
    
}



