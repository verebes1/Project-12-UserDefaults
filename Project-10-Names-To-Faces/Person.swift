//
//  Person.swift
//  Project-10-Names-To-Faces
//
//  Created by verebes on 26/06/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import UIKit

protocol MvcModelDelegate {
    func didUpDateName(name: String)
}

class Person: NSObject, NSCoding {
    
    var name: String {
        didSet{
            delegate?.didUpDateName(name: name)
        }
    }
    var image: String
    
    var delegate: MvcModelDelegate?
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        image = aDecoder.decodeObject(forKey: "image") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }

}
