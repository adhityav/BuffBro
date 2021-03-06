//
//  ListViewController.swift
//  BuffBro
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Adhitya Vadivel. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController, UINavigationControllerDelegate {
    
   var myManager = ExerciseManager()
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as!AddViewController
            if let newItem = addVC.newItem {
                myManager.items += [newItem]
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                print("Added new item")
            }
        }
    }
    
    @IBAction func clear() {
        myManager.clear()
        myManager.save()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = myManager.items[indexPath.row]
        
        if item.completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.sets) Sets     \(item.reps) Reps"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = myManager.items[indexPath.row]
        item.completed = !item.completed
        myManager.save()
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "BuffBroAppIcon.png")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
}
