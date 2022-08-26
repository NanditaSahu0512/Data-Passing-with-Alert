//
//  ViewController.swift
//  DatapassingWithAlert
//
//  Created by Mac on 04/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    @IBOutlet weak var DataTableView: UITableView!
    
    var Students : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataTableView.dataSource = self
        DataTableView.delegate = self
        navigationItem.title = "Student Information"
        
        let uiNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.DataTableView.register(uiNib, forCellReuseIdentifier: "CustomTableViewCell")
        
    }

    @IBAction func addStudentDatabtn(_ sender: Any) {
        let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as? SecondViewController
        SecondViewController?.delegateSVC = self
        self.navigationController?.pushViewController(SecondViewController!, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         Students.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = self.DataTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",for:indexPath)as! CustomTableViewCell
        let eachStudent = Students[indexPath.row]
        studentCell.NameLable.text = eachStudent.StudentName
        studentCell.RollnoLable.text = String(eachStudent.RollNo)
        studentCell.CityLable.text = eachStudent.City
        studentCell.PhoneLable.text = eachStudent.PhoneNo
        return studentCell
    }
  
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            DataTableView.beginUpdates()
            Students.remove(at: indexPath.row)
            DataTableView.deleteRows(at: [indexPath], with: .fade)
            DataTableView.endUpdates()
        }
    }
    
}
extension ViewController: DataPassingProtocol{
    func passStudentData(student: Student) {
        let student = Student(StudentName: student.StudentName, RollNo: student.RollNo, City: student.City,PhoneNo: student.PhoneNo)
        Students.append(student)
        DataTableView.reloadData()
    }
}

