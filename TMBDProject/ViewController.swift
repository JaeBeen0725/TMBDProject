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

struct Movie {
    let movieDate: String
    let movieGengre: Int
    let movieThumbnail: String
    let movieTitle: String
    let movieCast: Int
}

class ViewController: UIViewController {
    
    @IBOutlet var movieCollectionView: UICollectionView!
    
    
    var movieList: [Movie] = []
    var genreList: [Int: String] = [28: "Action", 99: "Documentary", 16: "Animation", 36: "History", 27: "Horror", 12: "Adventure", 9648: "Mystery", 10749: "Romance", 10751: "Family", 14: "Fantasy", 878: "Science Fiction", 10752: "War", 18: "Drama", 10402: "Music", 53: "Thriller", 10770: "TV Movie", 80: "Crime", 37: "Western", 35: "Comedy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tmdb()
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        
        movieCollectionView.register(UINib(nibName: "MovieHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MovieHeaderCollectionReusableView")
        
        collectionViewLayout()
     
    }
 
    func collectionViewLayout() {

//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 200, height: 200)
//        layout.minimumLineSpacing = 8
//        layout.minimumInteritemSpacing = 8
//        layout.scrollDirection = .vertical
//        layout.headerReferenceSize = CGSize(width: 300, height: 50)

        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 1
        let width = UIScreen.main.bounds.width - (spacing * 1)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
       movieCollectionView.collectionViewLayout = layout
    }
   
    func tmdb() {
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(Key.tmdb)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["results"].arrayValue {

                    let cast = item["id"].intValue
                    let genre = item["genre_ids"][0].intValue
                    let thumbnail = item["poster_path"].stringValue
                    let title = item["title"].stringValue
                    let date = item["release_date"].stringValue
                    
                    let data = Movie(movieDate: date, movieGengre: genre, movieThumbnail: thumbnail, movieTitle: title, movieCast: cast)
                    print("data is", data)
                    self.movieList.append(data)
                
                }
                print(self.movieList.count)
            
                self.movieCollectionView.reloadData()
                            
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    
   
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
 
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//       return movieList.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.movieCastLabel.text = String(movieList[indexPath.row].movieCast)
        cell.movieTitleLabel.text = movieList[indexPath.row].movieTitle
        cell.movieDateLabel.text = movieList[indexPath.row].movieDate
        cell.movieGenreLabel.text = genreList[movieList[indexPath.row].movieGengre]
   
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movieList[indexPath.row].movieThumbnail)") {
            cell.movieThumbnailImageView.kf.setImage(with: url)
        } else {
            print("이미지 없음")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
                    return
                }
                
        vc.testdata = movieList[indexPath.row].movieCast
                self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieHeaderCollectionReusableView", for: indexPath) as? MovieHeaderCollectionReusableView else { return UICollectionReusableView() }
            view.movieDateLabel.text = movieList[indexPath.row].movieDate
            view.movieGenreLabel.text = genreList[movieList[indexPath.row].movieGengre]
            
            
            return view
        } else {
            return UICollectionReusableView()
        }
    }
    */
    
}




