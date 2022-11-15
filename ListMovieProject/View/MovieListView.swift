//
//  MovieListView.swift
//  ListMovieProject
//
//  Created by Aditya Ramadhan on 15/11/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct MovieListView: View {
    
    @State private var isSelected = false
    @State var movieImageURL = ""
    @State var bannerimageURL = ""
    @State var releaseDate = ""
    @State var description = ""
    @State var voteRating = 0.0
    @State var voteCount = 0.0
    @State var movieName = ""
    @ObservedObject var obs = observer()
    
        var body: some View {
            NavigationView{
                    List(obs.movies){ item in
                        MovieCell(movieImageURL: item.movieImageURL, movieName: item.name,voteRating: item.voteRating)
                            .onTapGesture {
                                self.isSelected.toggle()
                                self.movieImageURL = item.movieImageURL
                                self.bannerimageURL = item.bannerImageURL
                                self.releaseDate = item.releaseDate
                                self.description = item.description
                                self.voteRating = item.voteRating
                                self.voteCount = item.voteCount
                                self.movieName = item.name
                            }.sheet(isPresented: $isSelected, content: {
                                MovieDetailView(movieName: movieName , movieImageURL: movieImageURL, bannerimageURL: bannerimageURL, releaseDate: releaseDate, description: description,
                                                voteRating:voteRating, voteCount: voteCount)
                            })
                    }
                    .navigationBarTitle("Movie List")
            }
        }
}

class observer : ObservableObject {
    @Published var movies = [Movie] ()
    var MovieArrays = [AnyObject]()
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5896c0e985dd93d82fbdc6d0215cb863&language=en-US&page=1")
    
    init() {
        AF.request(url!).responseData { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                let count = json["results"].count
                for i in (0...count-1){
                    self.movies.append(Movie(id: json["results"][i]["id"].intValue , name: json["results"][i]["original_title"].string ?? "error", description: json["results"][i]["overview"].string ?? "error", movieImageURL: json["results"][i]["poster_path"].string ?? "error", bannerImageURL: json["results"][i]["backdrop_path"].string ?? "error", releaseDate: json["results"][i]["release_date"].string ?? "error" , voteRating: json["results"][i]["vote_average"].double ?? 0.0, voteCount: json["results"][i]["vote_count"].double ?? 0.0)
                    )
                }
                case .failure(let error):
                    print(error)
                }
        }
    }
}
