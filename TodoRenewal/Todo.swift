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
    var id: String! // New
    var title = ""
    var descript = ""
    var priority: TodoPriority = .Low
    var comments: [Comment] = [] // New
    
    //MARK: New
    func addComment(comment: Comment) {
        self.comments.append(comment)
        self.saveComment()
    }
    
    func saveComment() {
        var commentList: [String] = []
        for comment in comments {
            commentList.append(comment.text)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(commentList, forKey: self.id)
        defaults.synchronize()
    }
    
    func fetchComments() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let comments = defaults.objectForKey(self.id) as? [String] {
            for commentText in comments {
                let comment = Comment()
                comment.text = commentText
                self.comments.append(comment)
            }
        }
    }
    
    func createId() {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let dateString = dateFormatter.stringFromDate(now)
        let randomValue = arc4random() % 100000
        let id = dateString + String(randomValue)
        self.id = id
    }
}
