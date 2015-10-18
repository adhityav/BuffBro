//
//  PhotoItem.swift
//  BuffBro
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Adhitya Vadivel. All rights reserved.
//

import Foundation
import UIKit

class PhotoItem: NSObject, NSCoding {
    
    var name: String?
    var photo: UIImage?
    
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    override init() {
       self.name = nil
        self.photo = nil
    }
    
}

