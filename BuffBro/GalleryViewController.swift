//
//  GalleryViewController.swift
//  BuffBro
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Adhitya Vadivel. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var newPhotoItem: PhotoItem?
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
//        let myPhotoManager = PhotoManager()
        
        // TODO:
        // 1. Get the photo
//        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let photoItem = PhotoItem()
//        photoItem.photo = photo
//        myPhotoManager.save()
        // 2. Dismiss the picker
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            // 3. After it has been dismissed (in the compltion closure), present a UIAlertController with a text field.
            
            
            let alert = UIAlertController(title: "Description", message: "Please enter a description for your photo.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addTextFieldWithConfigurationHandler(nil)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler:nil))
            alert.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: { (action) in
                let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
                let photoItem = PhotoItem()
                photoItem.photo = photo
                photoItem.name = alert.textFields?[0].text
                self.myPhotoManager.items.append(photoItem)
                self.myPhotoManager.save()
//                picker.dismissViewControllerAnimated(true, completion: { () -> Void in
//                    print("new we have \(self.myPhotoManager.items.count) items")
                    self.tableView.reloadData()
//                })
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    
//            // 4. When the alert controller is dismissed, save the photo item with the name and photo.
//            
//            //        if let indexPath = tableView.indexPathForSelectedRow {
//            //            let selectedItem = myPhotoManager.items[indexPath.row]
//            let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
//            //            selectedItem.photo = photo
//            let photoItem = PhotoItem()
//            photoItem.photo = photo
//            myPhotoManager.save()
//            picker.dismissViewControllerAnimated(true, completion: { () -> Void in
//                self.tableView.reloadData()
//                //                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            })
//            //        }
//        })
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    let myPhotoManager = PhotoManager()

    @IBAction func addPhoto() {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            picker.sourceType = .Camera
        } else {
            picker.sourceType = .PhotoLibrary
        }
        picker.delegate = self
        self.presentViewController(picker, animated: true) { () -> Void in
//            myPhotoManager.items += [newPhotoItem]
//            myPhotoManager.save()
//            let indexPath = NSIndexPath(forRow: myPhotoManager.items.count - 1, inSection: 0)
//            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(myPhotoManager.items.count)
        return myPhotoManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = myPhotoManager.items[indexPath.row]
        cell.textLabel?.text = item.name
        
//        if item.isComplete {
            cell.imageView?.image = item.photo
//        } else {
//            cell.imageView?.image = nil
//        }
        return cell
    }
    
}