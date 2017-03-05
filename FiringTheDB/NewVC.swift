
//
//  NewVC.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/4/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit

class NewVC: UIViewController {

    @IBAction func backpressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
