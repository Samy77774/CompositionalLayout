//
//  Model.swift
//  MenuBar2
//
//  Created by samy on 17/07/2022.
//  Copyright © 2022 samy. All rights reserved.
//


import Foundation
import UIKit

struct MenuModel {
    var image:UIImage?
    
    enum CodingKeys : String , CodingKey {
        case image
    }
}
