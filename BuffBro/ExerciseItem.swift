//
//  ExerciseItem.swift
//  BuffBro
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Adhitya Vadivel. All rights reserved.
//

import Foundation
import UIKit

class ExerciseItem: NSObject, NSCoding {
    
    let name: String
    let sets: Int
    let reps: Int
    var completed: Bool = false
    
    let nameKey = "name"
    let setsKey = "sets"
    let repsKey = "reps"
    let completedKey = "completed"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeInt(Int32(sets), forKey: setsKey)
        aCoder.encodeInt(Int32(reps), forKey: repsKey)
        aCoder.encodeBool(completed, forKey: completedKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        sets = Int(aDecoder.decodeIntForKey(setsKey))
        reps = Int(aDecoder.decodeIntForKey(repsKey))
        completed = aDecoder.decodeBoolForKey(completedKey)
    }
    
    init(name: String, sets: Int, reps: Int) {
        self.name = name
        self.sets = sets
        self.reps = reps
    }
    
    
    
}
