//
//  DetailMoviesViewController.swift
//  MovieViewer
//
//  Created by Sanaya Sanghvi on 1/16/16.
//  Copyright © 2016 Sanaya Sanghvi. All rights reserved.
//

import UIKit

class DetailMoviesViewController: UIViewController {

    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var overviewLabel: UILabel!
    
    @IBOutlet var languageLabel: UILabel!
 
    
    
 
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        print(movie)
        
        let title = movie["title"] as! String
        titleLabel.text = title
        
        let overview = movie["overview"] as! String
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        let baseURL = "http://image.tmdb.org/t/p/w500/"
        
        if let posterPath = movie["poster_path"] as? String {
            let imageURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWithURL(imageURL!)
            
        }
        
        let language = movie["original_language"] as! String
        languageLabel.text = "Language: \(language.uppercaseString)"
        
      
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
