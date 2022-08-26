//
//  SecondViewController.swift
//  DatapassingWithAlert
//
//  Created by Mac on 04/07/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextName: UITextField!
    
    @IBOutlet weak var dataTextRollNo: UITextField!
    
    @IBOutlet weak var dataTextCity: UITextField!
    
    @IBOutlet weak var dataTextPhone: UITextField!
    
    var delegateSVC : DataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveDataButton(_ sender: Any) {
        guard let delegateSVC = delegateSVC else {
            return
        }
        if self.dataTextName.text!.isEmpty || self.dataTextRollNo.text!.isEmpty || self.dataTextCity.text!.isEmpty ||
            self.dataTextPhone.text!.isEmpty {
            
            let dataAlertController = UIAlertController(title: "Student Data", message: "Please Enter Data", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            
            dataAlertController.addAction(actionOk)
           
            self.present(dataAlertController,animated: true, completion: nil)
            
        }
        
        else{
        let studentNameToPass = self.dataTextName.text ?? "Name"
        let studentRollNoToPass = self.dataTextRollNo.text ?? "0"
        let studentCityToPass = self.dataTextCity.text ?? "City"
        let studentPhoneNoToPass = self.dataTextPhone.text ?? "PhoneNo"
        
        let studentObjectToPass = Student(StudentName: studentNameToPass, RollNo: Int(studentRollNoToPass) ?? 0, City: studentCityToPass, PhoneNo: studentPhoneNoToPass)
        
        delegateSVC.passStudentData(student: studentObjectToPass)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
