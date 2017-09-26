//
//  TableViewController.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/23/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit
import MovieSelectrBridge

class TableViewController: UITableViewController {

    var nowPlaying = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {
        
        Movie.nowPlaying { (success: Bool, movieList:[Movie]?) in
            
            if success {
                self.nowPlaying = movieList!
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return nowPlaying.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = nowPlaying[indexPath.row].title
        cell.detailTextLabel?.text = nowPlaying[indexPath.row].description
        Movie.getImage(forCell: cell, withMovieObject: nowPlaying[indexPath.row])
        return cell
    }
 
}
