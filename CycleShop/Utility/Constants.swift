//
//  Constants.swift
//  TouchDown
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI

public let userDefaults = UserDefaults.standard

// DATA

let cyclemodels : [Model] = Bundle.main.decode("model.json")
let accessories : [Accessory] = Bundle.main.decode("accessories.json")
let products : [Product] = Bundle.main.decode("product.json")
let sampleProduct :Product = products[0]

//Color

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

//LAYOUT
let columnSpacing:CGFloat = 10
let rowSpacing :CGFloat = 10
var gridLayout: [GridItem] {
    
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}


let feedback = UIImpactFeedbackGenerator(style: .medium)

//Firestore

//Product
public let kID = "id"
public let kNAME = "name"
public let kPRICE = "price"
public let kIMAGE = "image"
public let kSpec = "specification"

//Order
public let kPRODUCTIDS = "productIds"
public let kCUSTOMERID = "customerId"
public let kAMOUNT = "amount"
public let kOWNERID = "OwnerId"



//FUser

public let kEMAIL = "email"
public let kFIRSTNAME = "firstname"
public let kLASTNAME = "lastname"
public let kFULLNAME = "fullname"
public let kCURRENTUSER = "currentUser"
public let kFULLADRESS = "fullAddress"
public let kPHONENUBER = "phoneNumber"
public let kONBOARD = "onBoard"
