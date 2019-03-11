//
//  Reminder.swift
//  App
//
//  Created by Rafael Hernandez Almazan on 10/11/18.
//  Copyright © 2018 Rafael Hernandez Almazan. All rights reserved.
//

import Foundation
struct Reminder{
    
    let text: String
    var completed: Bool
    
    mutating func toogleCompleted(){
        completed = !completed
    }
    
}
