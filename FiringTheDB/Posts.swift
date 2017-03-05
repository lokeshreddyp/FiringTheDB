//
//  Posts.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/5/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import Foundation


class Post {
    private var _imagecap:String!
    private var _imageurl:String!
    private var _likes:Int!
    private var _postid:String!
    
    
    var imagecap:String {
        return _imagecap
    }
    
    var imageurl : String {
        return _imageurl
    }
    
    var likes:Int {
        return _likes
    }
    
    var postid:String {
        return _postid
    }
    
    init(imagecap:String,imageurl:String,likes:Int) {
      self._imagecap = imagecap
        self._imageurl = imageurl
        self._likes = likes
    }
    
    init(postid:String,postdata:Dictionary<String,AnyObject>) {
        self._postid = postid
        if let fir_postimgname = postdata["imgname"] as? String {
            self._imagecap = fir_postimgname
        }
        
        if let imageurl_fir = postdata["imageurl"] as? String {
            self._imageurl = imageurl_fir
        }
        
        if let likes_fir = postdata["likes"] as? Int {
            self._likes = likes_fir
        }
        
        
    }
}
