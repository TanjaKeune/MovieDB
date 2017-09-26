//
//  MovieCollectionViewController.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/25/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {

    var nowPlaying = [Movie]()
    
    let movieTransitionDelagte = MovieTransitionDelagete()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {
        Movie.nowPlaying { (succsess: Bool, movieList: [Movie]?) in
            if succsess {
                self.nowPlaying = movieList!
                DispatchQueue.main.async {
                    self.collectionView!.reloadData()
                }
            }
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return nowPlaying.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
    
        let movie = nowPlaying[indexPath.row]
        cell.movieTitleLabel.text = movie.title
        Movie.getImage(forCell: cell, withMovieObject: movie)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showOverlayFor(indexPath: indexPath)
    }
 
    func showOverlayFor (indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let overlayVC = sb.instantiateViewController(withIdentifier: "Overlay") as! OverlayViewController

        transitioningDelegate = movieTransitionDelagte
        overlayVC.transitioningDelegate = movieTransitionDelagte
        overlayVC.modalPresentationStyle = .custom
        
        let movie = nowPlaying[indexPath.row]
        
        self.present(overlayVC, animated: true, completion: nil)
        overlayVC.movieItem = movie
    }
}
