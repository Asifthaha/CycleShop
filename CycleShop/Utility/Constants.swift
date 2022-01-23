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

struct ImageNames {
    static let chevron = "chevron.left"
    static let cart = "cart"
}

struct StaticText {
    static let bikes = "Bikes"
    static let price = "Price"
    static let SEK = "SEK"
    static let ratings = "Ratings"
    static let size = "Size"
    static let addToCart = "Item added to Cart"
    static let chooseSize = "Choose size"
}

struct FooterText {
     static let footerDesc = "We offer the most modern, comfortable, lightweight and durable bicycles in the market at afforadable prices."
    static let copyright  = "Copyright © Asif Thaha\nAll rights reserved"
   
}

struct AlertTexts {
    
    static let wrongEmailPass = "Incorrect Email or Password"
    static let verifyEmail = "Please verify your email and login"
    static let signUpAlert = "Please verify the link sent to your inbox and login"
    static let existingUser = "User Already exists"
    static let passwordsNoMatch = "Passwords do not match"
    static let setEmailPass = "Email and password must be set"
    static let checkEmailEntered = "Check the email you have entered"
    static let userNotExist = "User do not exixt"
    static let resetPassword = "An email is sent to your inbox to reset password"
    static let emailEmpty = "Enter your email and click me"
    
}

struct FbaseTexts {
   
    static let existingUser = "The email address is already in use by another account"
    static let badEmailFormat = "The email address is badly formatted"
    static let noUserExist = "There is no user record corresponding to this identifier"
    
    
}

struct UtilityTexts {
     static let signIn = "Sign In"
    static let signUp = "Sign Up"
     static let email = "Email"
     static let enterEmail = "Enter your email"
     static let password = "Password"
     static let enterPass = "Enter your password"
    static let repeatPass = "Repeat password"
    static let forgotPass = "Forgot password?"
    static let noAccount = "Dont have an Account?"
    static let error = "Error"
    
}
