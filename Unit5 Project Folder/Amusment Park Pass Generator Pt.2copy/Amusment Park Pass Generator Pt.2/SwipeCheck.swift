//
//  SwipeCheck.swift
//  Amusment Park Pass Generator Pt.1
//
//  Created by Joseph Heydorn on 5/22/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation
//A check if the guest has all the proper information needed to enter the park

var entranceCheck = true
func swipeEnterPark() {
    if guestTypeCheck.rideAccess == true {
        entranceCheck = true
    } else {
        entranceCheck = false
    }
}

//Entrance To Specific Area Check
func swipeAmusement() {
    if guestTypeCheck.amusementArea == true {
        entranceCheck = true
    } else {
        entranceCheck = false
    }
}
func swipeOffice() {
    if guestTypeCheck.officeArea == true {
        entranceCheck = true
    } else {
        entranceCheck = false
    }
}

func swipeEmployee() {
    if guestTypeCheck.employeeAccess == true {
        entranceCheck = true
    } else {
        entranceCheck = false
    }
}

//Remove this function in the final process, this tests ever swipe function
func checkSwipe() {
    swipeAmusement()
    swipeOffice()
    swipeEnterPark()
}
