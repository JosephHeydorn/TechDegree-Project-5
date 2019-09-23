//
//  GatheringCustomerInformation.swift
//  Amusment Park Pass Generator Pt.1
//
//  Created by Joseph Heydorn on 5/27/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//
//Below Sets Up what will be filled in when the text fields are edited. 
import Foundation
protocol EmployeeFormat {
    var isWorker: Bool? { get }
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Any? { get }
    var dateOfBirth: String { get }
    var companyName: String { get }
    var ssn: String { get }
    var projectNumber: String { get }
}

class EmployeeInformation: EmployeeFormat {
    var isWorker: Bool?
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Any?
    var dateOfBirth: String
    var companyName: String
    var ssn: String
    var projectNumber: String
    
    init(isWorker: Bool?, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Any?, dateOfBirth: String, companyName: String, ssn: String, projectNumber: String) {
        self.isWorker = isWorker
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dateOfBirth = dateOfBirth
        self.companyName = companyName
        self.ssn = ssn
        self.projectNumber = projectNumber
        
    }
}

// Error Handler
func verifyInformation() throws {
    if employeeInformationGather.dateOfBirth == "" {
        throw MissingInfoError.missingBirthday
    } else if employeeInformationGather.firstName == "" {
        throw MissingInfoError.missingFirstName
    } else if employeeInformationGather.lastName == "" {
        throw MissingInfoError.missingLastName
    } else if employeeInformationGather.streetAddress == "" || employeeInformationGather.city == "" || employeeInformationGather.state == "" || employeeInformationGather.zipCode == nil {
        throw MissingInfoError.missingAddressInfo
    } else if employeeInformationGather.ssn == "" {
        throw MissingInfoError.missingSSN
    } else if employeeInformationGather.projectNumber == "1001" || employeeInformationGather.projectNumber == "1002" || employeeInformationGather.projectNumber == "1003" || employeeInformationGather.projectNumber == "2001" || employeeInformationGather.projectNumber == "2002" {
        throw MissingInfoError.allPassed
    } else if employeeInformationGather.projectNumber == "" || employeeInformationGather.projectNumber != "1001" || employeeInformationGather.projectNumber != "1002" || employeeInformationGather.projectNumber != "1003" || employeeInformationGather.projectNumber != "2001" || employeeInformationGather.projectNumber != "2002" {
        throw MissingInfoError.missingProjectNumber
    } else {
        print("Thank you for registering!")
    }
}



// Company Check
func companyVerifyInformation() throws {
    if employeeInformationGather.companyName == "Acme" || employeeInformationGather.companyName == "Orkin" || employeeInformationGather.companyName == "Fedex" && employeeInformationGather.companyName == "NW Electrical" {
        print("Company Name Passed")
        throw MissingInfoError.allPassed
    }
    if employeeInformationGather.companyName == "" || employeeInformationGather.companyName != "Acme" || employeeInformationGather.companyName != "Orkin" || employeeInformationGather.companyName != "Fedex" && employeeInformationGather.companyName != "NW Electrical" {
        print("Threw company name")
        throw MissingInfoError.invalidCompanyName
    } else {
        print("All Good")
    }
}

