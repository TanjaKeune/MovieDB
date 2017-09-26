//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/26/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit
import MovieSelectrBridge

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    
    var movieObject: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        
    }
    func configureView() {
        
        movieTitleLabel.text = movieObject.title
        movieDescriptionTextView.text = movieObject.description
        
        if let availableImage = Movie.getImage(forMovie: movieObject) {
            
            movieImageView.image = availableImage
            
        }
    }
}
