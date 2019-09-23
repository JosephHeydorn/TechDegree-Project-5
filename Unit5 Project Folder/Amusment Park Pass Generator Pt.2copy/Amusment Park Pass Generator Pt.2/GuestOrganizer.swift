//
//  GuestOrganizer.swift
//  Amusment Park Pass Generator Pt.1
//
//  Created by Joseph Heydorn on 5/22/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

enum PassType: String {
    case classicGuest = "Classic Guest"
    case seniorGuest = "Senior Guest"
    case vipGuest = "VIP Guest"
    case freeChildGuest = "Child Guest"
    case foodService = "Food Service Employee"
    case rideService = "Ride Service Employee"
    case maintenance = "Maintenance Employee"
    case manager = "Manager"
    case contractEmployee = "Contract Employee"
    case seasonPass = "Season Pass Guest"
    case vendor = "Vendor"
}

enum PassTypeDef: String {
    case classicGuest = "All Ride Access \nNo discount"
    case vipSeasonPassGuest = "All Ride Access \nSkip All Lines \n10% Food Discount \n20% Merchandise Discount"
    case allEmployee = "All Ride Access \n15% Food Discount \n25% Merchandise Discount"
    case manager = "All Ride Access \n25% Food Discount \n25% Merchendise Discount"
    case seniorGuest = "All Ride Access \nSkip All Lines \n10% Food Discount \n10% Merchandise Discount"
    case vendor = ""
}

struct AllPassCheck {
    let amusementArea: Bool
    let kitchenArea: Bool
    let rideControllArea: Bool
    let maintinanceArea: Bool
    let officeArea: Bool
    let skipLine: Bool
    let rideAccess: Bool
    let discountAccessFood: Double?
    let discountAccessMerch: Double?
    let personalInformationRequirted: Bool
    let employeeAccess: Bool // This was added to create a wide spectrum of a pass swipe check.
}

//Below is the list of all the guest types

let classicGuest = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: true, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: false)

let vipGuestSeasonPass = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: true, rideAccess: true, discountAccessFood: 0.10, discountAccessMerch: 0.20, personalInformationRequirted: false, employeeAccess: false)

let freeChildGuest = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: true, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: true, employeeAccess: false)

let foodEmployee = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: true, discountAccessFood: 0.15, discountAccessMerch: 0.25, personalInformationRequirted: true, employeeAccess: true)
    
let rideEmployee = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: true, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: true, discountAccessFood: 0.15, discountAccessMerch: 0.25, personalInformationRequirted: true, employeeAccess: true)
    
let maintinance = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: true, maintinanceArea: true, officeArea: false, skipLine: false, rideAccess: true, discountAccessFood: 0.15, discountAccessMerch: 0.15, personalInformationRequirted: true, employeeAccess: true)
    
let manager = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: true, maintinanceArea: true, officeArea: true, skipLine: false, rideAccess: true, discountAccessFood: 0.25, discountAccessMerch: 0.25, personalInformationRequirted: true, employeeAccess: true)

let seniorGuest = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: true, rideAccess: true, discountAccessFood: 0.10, discountAccessMerch: 0.10, personalInformationRequirted: true, employeeAccess: false)

let acmeVendor = AllPassCheck(amusementArea: false, kitchenArea: true, rideControllArea: false, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: true, employeeAccess: true)

let orkinVendor = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: true, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let fedexVendor = AllPassCheck(amusementArea: false, kitchenArea: false, rideControllArea: false, maintinanceArea: true, officeArea: true, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let nwElectricVendor = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: true, maintinanceArea: true, officeArea: true, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let contract1001 = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: true, maintinanceArea: false, officeArea: false, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let contract1002 = AllPassCheck(amusementArea: true, kitchenArea: false, rideControllArea: true, maintinanceArea: true, officeArea: false, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let contract1003 = AllPassCheck(amusementArea: true, kitchenArea: true, rideControllArea: true, maintinanceArea: true, officeArea: true, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)

let contract2001 = AllPassCheck(amusementArea: false, kitchenArea: false, rideControllArea: false, maintinanceArea: false, officeArea: true, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: false)

let contract2002 = AllPassCheck(amusementArea: false, kitchenArea: true, rideControllArea: false, maintinanceArea: true, officeArea: true, skipLine: false, rideAccess: false, discountAccessFood: nil, discountAccessMerch: nil, personalInformationRequirted: false, employeeAccess: true)
