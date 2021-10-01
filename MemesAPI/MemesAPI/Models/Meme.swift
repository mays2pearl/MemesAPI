//
//  Meme.swift
//  MemesAPI
//
//  Created by Maysa on 30/09/21.
//

import Foundation

class MemeModel: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
