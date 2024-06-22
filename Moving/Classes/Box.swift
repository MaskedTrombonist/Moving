//
//  box.swift
//  Moving
//
//  Created by Michelle Thorn on 6/22/24.
//

import Foundation
import SwiftData

@Model
class Box {
    let name: String
    let code: Int32
    let desc: String
    
    init(name: String, code: Int32, desc: String) {
        self.name = name
        self.code = code
        self.desc = desc
    }
}
