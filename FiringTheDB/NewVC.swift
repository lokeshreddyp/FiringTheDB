
//
//  NewVC.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/4/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit

class NewVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBAction func backpressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
     var imagepicker:UIImagePickerController!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage]as? UIImage {
        imageadd.image = image
        }
        else {
            print("enter a valid image")
        }
        imagepicker.dismiss(animated: true, completion: nil)
    }

  
    @IBOutlet weak var imageadd: UIImageView!
    @IBAction func imagepressed(_ sender: UIButton) {
        
        present(imagepicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.allowsEditing = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
