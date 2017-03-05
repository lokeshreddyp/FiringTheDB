//
//  HomeViewController.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/3/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FBSDKCoreKit
import Firebase
class HomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var firimage: UIImageView!
    
    @IBOutlet weak var likenumber: UILabel!
    @IBOutlet weak var likeBTN: UIButton!
    
    @IBOutlet weak var imagename: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBAction func didTapLogOut(_ sender: UIButton) {
        
    
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
        
        let mainstoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let ViewController:UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(ViewController, animated: true, completion: nil)
        
        FBSDKAccessToken.setCurrent(nil)
        
    }
    
    var posts = [Post]()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // to test whether we are getting data from firebase or not
        let post = posts[indexPath.row]
       // let caption = post.imagecap
        print("Loki Image caption from fir is \(post.imagecap)")
        
        
        if let cell = tableview.dequeueReusableCell(withIdentifier: "HomeVC") as? PostcellTableViewCell {
        cell.configurecell(post: post)
            return cell
    }
        else {
            return PostcellTableViewCell()
        }
    
    }
    //firebase related
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        
        Dataservice.ds.REF_POSTS.observe(.value, with: { (snapshot) in
          //  print(snapshot.value)
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]
            {
                for snap in snapshot
                {
                   // print("SNAP POSTS LOKI \(snap)")
                    if let postDict = snap.value as? Dictionary<String,AnyObject> {
                        //key gives id of post
                        var key = snap.key
                        let post = Post(postid: key, postdata: postDict)
                        self.posts.append(post)
                    //    print("Loki post key is \(key)")
                    //    print("loki post data is \(post)")
                    }
                }
            }
            self.tableview.reloadData()
            
            
        })
        
        
        self.image.clipsToBounds = true
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            // ...
            let user = FIRAuth.auth()?.currentUser
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let email = user?.email
            let uid = user?.uid
            let photoURL = user?.photoURL
            
            self.name.text = email
            let profileic = NSData(contentsOf: photoURL!)
            self.image.image = UIImage(data: profileic! as Data)
        } else {
            // No user is signed in.
            // ...
        }
        
        
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
