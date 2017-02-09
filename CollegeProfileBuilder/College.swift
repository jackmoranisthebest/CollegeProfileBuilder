//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by jmoran2 on 2/6/17.
//  Copyright © 2017 Big J's Kobe size development team. All rights reserved.
//

import UIKit
import RealmSwift

class College: Object {
    
    var name = String()
    var location = String()
    var population = Int()
    var logo = Data()

convenience init(name: String, location: String, population: Int, logo: Data){
    self.init()
    self.name = name
    self.location = location
    self.population = population
    self.logo = logo
    
    }
}
