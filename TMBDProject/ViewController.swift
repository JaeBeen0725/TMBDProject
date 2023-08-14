//
//  ViewController.swift
//  TMBDProject
//
//  Created by Jae Oh on 2023/08/13.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet var movieCollectionView: UICollectionView!
    var movieList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
    }
    
    func tmdb() {
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(Key.tmdb)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TMDBCollectionViewCell", for: indexPath) as? TMDBCollectionViewCell else { return TMDBCollectionViewCell()}
        
        
        
        
    }
}

