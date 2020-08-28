//
//  MovieModel.swift
//  MvvmYoutube
//
//  Created by KULDEP KUMAR PRAJAPATI on 26/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    
    init(artistName:String, trackName:String) {
        self.artistName = artistName
        self.trackName = trackName
    }

}


class ResultModel: Decodable{
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
}
