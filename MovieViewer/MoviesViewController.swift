//
//  MoviesViewController.swift
//  MovieViewer
//
//  Created by Sanaya Sanghvi on 1/6/16.
//  Copyright © 2016 Sanaya Sanghvi. All rights reserved.
//

import UIKit
import AFNetworking


class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
  
    var refreshControl: UIRefreshControl!
  
    @IBOutlet weak var tableView: UITableView!
  
   
    @IBOutlet var networkerrorView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBOutlet var movieSearch: UISearchBar!
    
    @IBOutlet weak var switchView: UISwitch!
  
 
    
    var hidden = Bool()
    
    
    var movies: [NSDictionary]?
    
    var filteredData: [NSDictionary]?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        movieSearch.delegate = self
        
        networkerrorView.hidden = true
        
        navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl.tintColor = UIColor .orangeColor()
        tableView.addSubview(refreshControl)
        collectionView.addSubview(refreshControl)
        
     
        
        tableView.hidden = true
        
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = NSURL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            print("response: \(responseDictionary)")
                            
                            self.movies = responseDictionary["results"] as! [NSDictionary]
                            self.filteredData = self.movies
                            self.tableView.reloadData()
                            self.collectionView.reloadData()
                            
                            
                    }
                }
        });
        task.resume()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Table View 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      if let movies = filteredData {
        return filteredData!.count
      } else {
       
        return 0
      }
      
    }
    
    //TableView Data
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
      let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        
      let movie = filteredData![indexPath.row]
      let title = movie["title"] as! String
      let overview = movie["overview"] as! String
      let posterPath = movie["poster_path"] as! String
      
      let baseURL = "http://image.tmdb.org/t/p/w500/"
      
      let imageURL = NSURL(string: baseURL + posterPath)
      
      cell.titleLabel.text = title
      cell.overviewLabel.text = overview
      cell.posterView.setImageWithURL(imageURL!)
        
      print("row \(indexPath.row)")
        
      return cell
        
    }
    
    //Refresh Commands
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(2, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    
   
    // Collection View
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let movies = filteredData {
            return filteredData!.count
        } else {
            
            return 0
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCollectionCell", forIndexPath: indexPath) as! MovieCollectionCell
        
        
        let movie = filteredData![indexPath.row]
        let title = movie["title"] as! String
        let posterPath = movie["poster_path"] as! String
        
        let baseURL = "http://image.tmdb.org/t/p/w500/"
        
        let imageURL = NSURL(string: baseURL + posterPath)
        
        cell.titlecollectionLabel.text = title
        cell.postercollectionView.setImageWithURL(imageURL!)
        
        
        print("row \(indexPath.row)")
        
        return cell
        
        
        }
    
    //Button Switch
    
    @IBAction func viewSwitch(sender: UISwitch) {
        
        if switchView.on {
            tableView.hidden = true
            collectionView.hidden = false
            collectionView.addSubview(refreshControl)
        } else {
            tableView.hidden = false
            collectionView.hidden = true
            tableView.addSubview(refreshControl)
        }
        

    }
   
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? movies : movies!.filter({(movie: NSDictionary) -> Bool in
            
            let title = movie["title"] as! String
            
            return title.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
        })
        
        if movieSearch.text == "" {

            view.endEditing(true)
        }
        
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
   
    

}
    

