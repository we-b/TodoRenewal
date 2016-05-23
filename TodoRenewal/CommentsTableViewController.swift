//
//  CommentsTableViewController.swift
//  TodoRenewal
//
//  Created by 松下慶大 on 2016/05/23.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class CommentsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var todo: Todo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.commentTextField.delegate = self
        self.tableView.registerNib(UINib(nibName: "TodoCell", bundle: nil), forCellReuseIdentifier: "TodoCell")
        self.tableView.registerNib(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewTodoViewController.tapGesture(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return todo.comments.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath) as! TodoCell
            cell.titleLabel.text = todo.title
            cell.descriptionLabel.text = todo.descript
            cell.priorityView.backgroundColor = todo.priority.color()
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
            let comment = todo.comments[indexPath.row]
            cell.commentLabel.text = comment.text
            return cell
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Todo"
        } else {
            return "Comment"
        }
    }
    
    //MARK: TableView Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 138
        } else {
            return 50
        }
    }
    
    //MARK: TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if commentTextField.text == "" {
            let alertView = UIAlertController(title: "エラー", message: "コメントが記述されていません", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            let comment = Comment()
            comment.text = commentTextField.text
            todo.addComment(comment)
            self.tableView.reloadData()
            commentTextField.resignFirstResponder()
            commentTextField.text = ""
        }
        return true
    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        commentTextField.resignFirstResponder()
    }
}
