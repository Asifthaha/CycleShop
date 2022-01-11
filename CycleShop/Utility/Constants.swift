//
//  Constants.swift
//  TouchDown
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI

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


