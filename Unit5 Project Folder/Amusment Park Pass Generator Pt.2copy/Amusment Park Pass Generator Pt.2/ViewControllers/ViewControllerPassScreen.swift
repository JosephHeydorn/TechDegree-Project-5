//
//  ViewControllerPassScreen.swift
//  Amusment Park Pass Generator Pt.2
//
//  Created by Joseph Heydorn on 9/6/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

class ViewControllerPassScreen: UIViewController {
    @IBOutlet weak var areaAccessButton: UIButton!
    @IBOutlet weak var employeeAccessButton: UIButton!
    @IBOutlet weak var managerAccessButton: UIButton!
    
    @IBOutlet weak var accessAndDenyView: UIView!
    @IBOutlet weak var accessAndDenyLabel: UILabel!
    
    
    
    
    @IBOutlet weak var passholderNamePH: UILabel!
    @IBOutlet weak var passTypePH: UILabel!
    @IBOutlet weak var passBenifitsPH: UILabel!
    
    var firstNameResult: String? = nil
    var lastNameResult: String? = nil
    
    var passTypeResult = ""
    var passTypeDefResults = ""
    
    func getFullName() -> String {
        let a = firstNameResult!
        let b = lastNameResult!
        return "\(a) \(b)"
    }
    
    override func viewDidLoad() {
        passholderNamePH.text = getFullName()
        passTypePH.text = passTypeResult
        passBenifitsPH.text = passTypeDefResults
    
        super.viewDidLoad()
    }
    
    //Access Testing Buttons
    @IBAction func areaAccessButtonPressed(_ sender: UIButton) {
        swipeAmusement()
        accessCheck()
    }
    
    //Checks if they are able to access employee Areas
    @IBAction func employeeAccessButtonPressed(_ sender: UIButton) {
        swipeEmployee()
        accessCheck()
    }
    
    @IBAction func managerAccessButtonPressed(_ sender: UIButton) {
        swipeOffice()
        accessCheck()
    
    }
    
    
    
    //Access Testing Results
    func accessGranted() {
        accessAndDenyView.backgroundColor = .green
        accessAndDenyLabel.text = "Access Granted"
    }
    func accessFailed() {
        accessAndDenyView.backgroundColor = .red
        accessAndDenyLabel.text = "Access Failed"
    }
    
    func accessCheck() {
        if entranceCheck == true {
            accessGranted()
        } else {
            accessFailed()
        }
    }
    
}
