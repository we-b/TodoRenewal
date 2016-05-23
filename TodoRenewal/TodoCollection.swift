//
//  TodoManager.swift
//  TodoRenewal
//
//  Created by 松下慶大 on 2016/05/22.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    var todos:[Todo] = []
    static let sharedInstance = TodoCollection()
    
    func addTodoCollection(todo: Todo){
        self.todos.append(todo)
        self.save()
    }
    
    func fetchTodos() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let todoList = defaults.objectForKey("todoLists") as? Array<Dictionary<String, AnyObject>> {
            for todoDic in todoList {
                let todo = TodoCollection.convertTodoModel(todoDic)
                self.todos.append(todo)
            }
        }
    }
    
    func save (){
        var todoList: Array<Dictionary<String, AnyObject>> = []
        for todo in todos {
            let todoDic = TodoCollection.convertDictionary(todo)
            todoList.append(todoDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(todoList, forKey: "todoLists")
        defaults.synchronize()
    }
    
    class func convertTodoModel(attiributes: Dictionary<String, AnyObject>) -> Todo {
        let todo = Todo()
        todo.title = attiributes["title"] as! String
        todo.descript = attiributes["descript"] as! String
        todo.priority = TodoPriority(rawValue: attiributes["priority"] as! Int)!
        return todo
    }
    
    class func convertDictionary(todo: Todo) -> Dictionary<String, AnyObject> {
        var dic = Dictionary<String, AnyObject>()
        dic["title"] = todo.title
        dic["descript"] = todo.descript
        dic["priority"] = todo.priority.rawValue
        return dic
    }
    
}
