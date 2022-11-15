//
//  Movie.swift
//  ListMovieProject
//
//  Created by Aditya Ramadhan on 15/11/22.
//

import SwiftUI

struct Movie: Decodable,Identifiable {
    var id : Int
    var name : String
    var description : String
    var movieImageURL : String
    var bannerImageURL : String
    var releaseDate : String
    var voteRating : Double
    var voteCount : Double
}


