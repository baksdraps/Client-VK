//
//  Groups.swift
//  Client VK
//
//  Created by Максим Борисенко on 20.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit

struct Group: Equatable {
    let groupName: String
    let groupLogo: UIImage?
    
    // для проведения сравнения (.contains), только по имени
    static func ==(lhs: Group, rhs: Group) -> Bool {
        return lhs.groupName == rhs.groupName //&& lhs.groupLogo == rhs.groupLogo
    }
}
