//
//  OverlayViewController.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/26/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var movieItem: Movie!
//    ? {
//        didSet {
//            configureView()
//        }
//    }
    
    func configureView() {
        if let movie = self.movieItem {
            self.titleLabel.text = movie.title
            self.descriptionText.text = movie.description
        }
    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        self.view.bounds.size = CGSize(width: UIScreen.main.bounds.width - 20, height: 200)
//        
//        self.view.layer.cornerRadius = 5
//        
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    
//    @IBAction func closePressed(_ sender: Any) {
//        
//        presentingViewController?.dismiss(animated: true, completion: nil)
//    }


}
