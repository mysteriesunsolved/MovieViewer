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
 
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var infoView: UIView!
    
    var movie: NSDictionary!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor .blackColor()
        
       scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        print(movie)
        
        let title = movie["title"] as! String
        titleLabel.text = title
        
        let overview = movie["overview"] as! String
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        let baseURL = "http://image.tmdb.org/t/p/"
        
        if let posterPath = movie["poster_path"] as? String {
            
            let smallImageURL = NSURL(string: baseURL + "w45" + posterPath)
            let largeImageURL = NSURL(string: baseURL + "original" + posterPath)
            
            let smallImageRequest = NSURLRequest(URL: (smallImageURL)!)
            let largeImageRequest = NSURLRequest(URL: (largeImageURL)!)
            
           self.posterImageView.setImageWithURLRequest(
            smallImageRequest,
            placeholderImage: nil,
            success: { (smallImageRequest, smallImageResponse, smallImage) -> Void in
                
                self.posterImageView.alpha = 0.0
                self.posterImageView.image = smallImage;
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.posterImageView.alpha = 1.0
                    
                    }, completion: { (sucess) -> Void in
                        
                        self.posterImageView.setImageWithURLRequest(
                            largeImageRequest,
                            placeholderImage: nil,
                            success: { (largeImageRequest, largeImageResponse, largeImage) -> Void in
                                
                                self.posterImageView.image = largeImage;
                                
                            },
                            
                                failure: { (request, response, error) -> Void in
                                    
                                    print("error")
                        })
                    })
            },
            
            failure: { (request, response, error) -> Void in
                print("error 2")
           })
            
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
