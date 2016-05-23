//
//  Todo.swift
//  TodoRenewal
//
//  Created by 松下慶大 on 2016/05/22.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

enum TodoPriority: Int {
    case Low    = 0
    case Middle = 1
    case High   = 2
    
    func color() -> UIColor {
        switch self {
        case .Low:
            return UIColor.yellowColor()
        case .Middle:
            return UIColor.greenColor()
        case .High:
            return UIColor.redColor()
        }
    }
}

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority: TodoPriority = .Low
}
