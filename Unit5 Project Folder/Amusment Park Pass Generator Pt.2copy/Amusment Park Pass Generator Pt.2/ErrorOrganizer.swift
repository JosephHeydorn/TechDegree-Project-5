//
//  ErrorOrganizer.swift
//  Amusment Park Pass Generator Pt.1
//
//  Created by Joseph Heydorn on 5/27/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation
//All the errors used
enum MissingInfoError: Error {
    case missingBirthday
    case missingLastName
    case missingFirstName
    case missingAddressInfo
    case missingWorkerSpecification
    case missingSSN
    case missingProjectNumber
    case invalidCompanyName
    case allPassed
}

enum majorErrorOccurance: Error {
    case error1 // This error is if the pass some how missess a bool check in an if statement
}
