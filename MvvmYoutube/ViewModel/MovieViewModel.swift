//
//  MovieViewModel.swift
//  MvvmYoutube
//
//  Created by KULDEP KUMAR PRAJAPATI on 28/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    
    var artistName: String?
    var trackName: String?
    
    //Dependancy injection
    
    init(movie: MovieModel) {
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
