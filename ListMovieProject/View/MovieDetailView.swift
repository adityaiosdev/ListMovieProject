//
//  MovieDetailView.swift
//  ListMovieProject
//
//  Created by Aditya Ramadhan on 15/11/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @State var movieName = ""
    @State var movieImageURL = ""
    @State var bannerimageURL = ""
    @State var releaseDate = ""
    @State var description = ""
    @State var voteRating = 0.0
    @State var voteCount = 0.0
    var body: some View {
        ZStack {
            VStack{
                VStack(alignment: .leading){
                
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w440_and_h660_face" + bannerimageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 170)
                        .background(Color.gray)
                        .padding(.top)
                        .padding(.bottom)
                        .clipped()
                    Text(movieName)
                        .font(.system(size: 28,weight: .bold))
                        .padding(.horizontal,32)
                    Text("Release Date: "+releaseDate)
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.horizontal,32)
                }
                Divider()
                HStack (spacing: 20){
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w440_and_h660_face" + movieImageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 150)
                        .background(Color.gray)
                        .padding(.top)
                        .padding(.bottom)
                        .clipped()
                    Text(description)
                        .fontWeight(.light)
                        .font(.system(size: 14))
                    
                }.padding(.horizontal,32)
                    .padding(.vertical,32)
                    VStack {
                        Text( "Vote Rating \(String(format: "%.1f", voteRating))/10")
                            .font(.system(size: 16, weight: .regular))
                        Text("Out of \(String(format: "%.0f", voteCount)) vote")
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.top,32)
                Spacer()
            }
        }
    }
}


