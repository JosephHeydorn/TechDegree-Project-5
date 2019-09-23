//
//  ViewController.swift
//  Amusment Park Pass Generator Pt.2
//
//  Created by Joseph Heydorn on 5/21/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

//Below Are all the test cases

//Place Holder Values All of these will be changed when buttons are pressed
var guestTypeCheck = classicGuest
var employeeInformationGather = EmployeeInformation(isWorker: true, firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 12345, dateOfBirth: "", companyName: "", ssn: "", projectNumber: "")

class ViewController: UIViewController {
    
    //This Sets each Text Field to gather the information for different value checks.
    func textFieldMatcher() {
        employeeInformationGather.firstName = firstNameTextField.text!
        employeeInformationGather.lastName = lastNameTextField.text!
        employeeInformationGather.streetAddress = streetAddressTextField.text!
        employeeInformationGather.city = cityTextField.text!
        employeeInformationGather.state = stateTextField.text!
        employeeInformationGather.zipCode = zipCodeTextField.text!
        employeeInformationGather.dateOfBirth = dobTextField.text!
        employeeInformationGather.companyName = companyTextField.text!
        employeeInformationGather.ssn = ssnTextField.text!
        employeeInformationGather.projectNumber = projectTextField.text!
    }
    
    //Gather Text Field Info
    var passTypeCheck = PassType.classicGuest
    var passTypeDefinition = PassTypeDef.classicGuest
    
    //Manager Bar/Stack Button
    @IBOutlet weak var managerStackView: UIStackView!
    @IBOutlet weak var shiftButton: UIButton!
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var seniorManagerButton: UIButton!
    
    //Employee Bar/Stack Button 
    @IBOutlet weak var employeeStackView: UIStackView!
    @IBOutlet weak var foodServiceButton: UIButton!
    @IBOutlet weak var rideServiceButton: UIButton!
    @IBOutlet weak var maintinenceButton: UIButton!
    @IBOutlet weak var contractButton: UIButton!
    
    //Guest Bar/Stack Button
    @IBOutlet weak var guestStackView: UIStackView!
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var adultButton: UIButton!
    @IBOutlet weak var seniorButton: UIButton!
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var seasonPassButton: UIButton!
    
    //Top Bar Buttons
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    //Data Text Fields
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var projectTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    //Generate Pass Button
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    //Stack View Managment
    func hideAllStackViews() {
        employeeStackView.isHidden = true
        guestStackView.isHidden = true
        managerStackView.isHidden = true
    }
    func showGuestStackView() {
        hideAllStackViews()
        guestStackView.isHidden = false
    }
    func showEmployeeStackView() {
        hideAllStackViews()
        employeeStackView.isHidden = false
    }
    func showManagerStackView() {
        hideAllStackViews()
        managerStackView.isHidden = false
    }
    
    func disableAllTextFields() {
        dobTextField.isEnabled = false
        dobTextField.alpha = 0.5
        ssnTextField.isEnabled = false
        ssnTextField.alpha = 0.5
        projectTextField.isEnabled = false
        projectTextField.alpha = 0.5
        firstNameTextField.isEnabled = false
        firstNameTextField.alpha = 0.5
        lastNameTextField.isEnabled = false
        lastNameTextField.alpha = 0.5
        companyTextField.isEnabled = false
        companyTextField.alpha = 0.5
        streetAddressTextField.isEnabled = false
        streetAddressTextField.alpha = 0.5
        cityTextField.isEnabled = false
        cityTextField.alpha = 0.5
        stateTextField.isEnabled = false
        stateTextField.alpha = 0.5
        zipCodeTextField.isEnabled = false
        zipCodeTextField.alpha = 0.5
    }
    
    func enableAllTopButtons() {
        guestButton.isEnabled = true
        guestButton.alpha = 1
        employeeButton.isEnabled = true
        employeeButton.alpha = 1
        managerButton.isEnabled = true
        managerButton.alpha = 1
        vendorButton.isEnabled = true
        vendorButton.alpha = 1
    }
    // Function To Create The Alert Buttons
    func createAlert (title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Error Handle for all text fields except Company Name
    func verifyInfo() {
        do {
            try verifyInformation()
        } catch MissingInfoError.missingBirthday {
            if dobTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter Your Date Of Birth!")
            }
        } catch MissingInfoError.missingFirstName {
            if firstNameTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter Your First Name!")
            }
        } catch MissingInfoError.missingLastName {
            if lastNameTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter Your Last Name!")
            }
        } catch MissingInfoError.missingAddressInfo {
            if streetAddressTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter Complete Address")
            }
        } catch MissingInfoError.invalidCompanyName {
            print("Caught it")
            if companyTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter A Valid Company Name")
            }
        } catch MissingInfoError.missingSSN {
            if ssnTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter A Valid SSN")
            }
        } catch MissingInfoError.missingProjectNumber {
            if projectTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter A Valid Project Number")
            }
        }catch{
            print("\(error)")
        }
    }
    // Error Handle for Company Name
    func verifyCompanyInfo() {
        do {
            try companyVerifyInformation()
        } catch MissingInfoError.invalidCompanyName {
            if companyTextField.isEnabled {
                createAlert(title: "Error!", message: "Please Enter A Valid Company Name")
            }
        } catch{
            print("Error")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllStackViews()
        disableAllTextFields()
    }
    //Top Bar Button Control
    @IBAction func guestButtonPressed(_ sender: UIButton) {
        showGuestStackView()
        enableAllTopButtons()
        guestButton.isEnabled = false
        guestButton.alpha = 0.5
    }
    @IBAction func employeeButtonPressed(_ sender: UIButton) {
        showEmployeeStackView()
        enableAllTopButtons()
        employeeButton.isEnabled = false
        employeeButton.alpha = 0.5
    }
    @IBAction func managerButtonPressed(_ sender: UIButton) {
        showManagerStackView()
        enableAllTopButtons()
        managerButton.isEnabled = false
        managerButton.alpha = 0.5
    }
    @IBAction func vendorButtonPressed(_ sender: UIButton) {
        hideAllStackViews()
        enableAllTopButtons()
        vendorButton.isEnabled = false
        vendorButton.alpha = 0.5
        
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        companyTextField.isEnabled = true
        companyTextField.alpha = 1.0
        
        passTypeCheck = PassType.vendor
        passTypeDefinition = PassTypeDef.vendor
        
        
    }
    //Middle View Button Control
    
    //Guest Buttons Pressed
    @IBAction func childButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        
        passTypeCheck = PassType.freeChildGuest
        guestTypeCheck = classicGuest
        passTypeDefinition = PassTypeDef.classicGuest
        
    }
    @IBAction func adultButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        
        passTypeCheck = PassType.classicGuest
        guestTypeCheck = classicGuest
        passTypeDefinition = PassTypeDef.classicGuest
        
    }
    @IBAction func seniorButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        
        passTypeCheck = PassType.seniorGuest
        guestTypeCheck = seniorGuest
        passTypeDefinition = PassTypeDef.seniorGuest
    }
    @IBAction func vipButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        
        passTypeCheck = PassType.vipGuest
        guestTypeCheck = vipGuestSeasonPass
        passTypeDefinition = PassTypeDef.vipSeasonPassGuest
    }
    @IBAction func seasonPassButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        
        passTypeCheck = PassType.seasonPass
        guestTypeCheck = vipGuestSeasonPass
        passTypeDefinition = PassTypeDef.vipSeasonPassGuest
    }
    
    //Employee Buttons Pressed
    @IBAction func foodServiceButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.foodService
        guestTypeCheck = foodEmployee
        passTypeDefinition = PassTypeDef.allEmployee
    }
    @IBAction func rideServiceButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.rideService
        guestTypeCheck = rideEmployee
        passTypeDefinition = PassTypeDef.allEmployee
    }
    @IBAction func maintinenceButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.maintenance
        guestTypeCheck = maintinance
        passTypeDefinition = PassTypeDef.allEmployee
    }
    @IBAction func contractButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        projectTextField.isEnabled = true
        projectTextField.alpha = 1.0
        
        passTypeCheck = PassType.contractEmployee
        passTypeDefinition = PassTypeDef.vendor
    }
    
    //Manager Buttons Pressed
    @IBAction func shiftButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.manager
        guestTypeCheck = manager
        passTypeDefinition = PassTypeDef.manager
    }
    @IBAction func generalButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.manager
        guestTypeCheck = manager
        passTypeDefinition = PassTypeDef.manager
    }
    @IBAction func seniorManagerButtonPressed(_ sender: UIButton) {
        disableAllTextFields()
        dobTextField.isEnabled = true
        dobTextField.alpha = 1.0
        firstNameTextField.isEnabled = true
        firstNameTextField.alpha = 1.0
        lastNameTextField.isEnabled = true
        lastNameTextField.alpha = 1.0
        streetAddressTextField.isEnabled = true
        streetAddressTextField.alpha = 1.0
        cityTextField.isEnabled = true
        cityTextField.alpha = 1.0
        stateTextField.isEnabled = true
        stateTextField.alpha = 1.0
        zipCodeTextField.isEnabled = true
        zipCodeTextField.alpha = 1.0
        ssnTextField.isEnabled = true
        ssnTextField.alpha = 1.0
        
        passTypeCheck = PassType.manager
        guestTypeCheck = manager
        passTypeDefinition = PassTypeDef.manager
    }
    
    
    //Generate Pass Button Pressed
    
    var passTypeTransferData = ""
    var passTypeDefTransferData = ""
    @IBAction func generatePassButtonPressed(_ sender: UIButton) {
        passTypeTransferData = passTypeCheck.rawValue
        passTypeDefTransferData = passTypeDefinition.rawValue
        textFieldMatcher()
        verifyInfo()
        verifyCompanyInfo()
        vendorAndContractCheck()
    }
    
    
    //Pass Information Over to the new VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ViewControllerPassScreen = segue.destination as? ViewControllerPassScreen {
            ViewControllerPassScreen.firstNameResult = firstNameTextField.text
            ViewControllerPassScreen.lastNameResult = lastNameTextField.text
            ViewControllerPassScreen.passTypeResult = passTypeTransferData
            ViewControllerPassScreen.passTypeDefResults = passTypeDefTransferData
        }
    }
    
    
    //This is populates all the data when the button is pressed. 
    @IBAction func populateDataButtonPressed(_ sender: UIButton) {
        if dobTextField.isEnabled {
            dobTextField.text = "01/01/2000"
        }
        if firstNameTextField.isEnabled && lastNameTextField.isEnabled {
            firstNameTextField.text = "John"
            lastNameTextField.text = "Doe"
        }
        if companyTextField.isEnabled {
            companyTextField.text = "Acme"
        }
        if streetAddressTextField.isEnabled && cityTextField.isEnabled && stateTextField.isEnabled && zipCodeTextField.isEnabled {
            streetAddressTextField.text = "123 Street Rd."
            cityTextField.text = "Some City"
            stateTextField.text = "Some State"
            zipCodeTextField.text = "12345"
        }
        if ssnTextField.isEnabled {
            ssnTextField.text = "012345678"
        }
        if projectTextField.isEnabled {
            projectTextField.text = "1001"
        }
    }
    
    
   //Below Is To Assess Different Pass Types For The Vendor and Contract Employees
    func vendorAndContractCheck() {
        if companyTextField.isEnabled {
            assignPassTypeVendor()
        }
        if projectTextField.isEnabled {
        assingPassTypeContract()
        }
    }
    
    func assignPassTypeVendor() {
        if companyTextField.text == "Acme" {
            guestTypeCheck = acmeVendor
        } else if companyTextField.text == "Orkin" {
            guestTypeCheck = orkinVendor
        } else if companyTextField.text == "Fedex" {
            guestTypeCheck = fedexVendor
        } else if companyTextField.text == "NW Electrical" {
            guestTypeCheck = nwElectricVendor
        }
     }
    
    func assingPassTypeContract() {
        if projectTextField.text == "1001" {
            guestTypeCheck = contract1001
        } else if projectTextField.text == "1002" {
            guestTypeCheck = contract1002
        } else if projectTextField.text == "1003" {
            guestTypeCheck = contract1003
        } else if projectTextField.text == "2001" {
            guestTypeCheck = contract2001
        } else if projectTextField.text == "2002" {
            guestTypeCheck = contract2002 
        }
    }
    
    
    
    
    
}


