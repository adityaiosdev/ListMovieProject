//
//  MovieCell.swift
//  ListMovieProject
//
//  Created by Aditya Ramadhan on 15/11/22.
//

import SwiftUI

struct MovieCell: View {
    @State var movieImageURL = ""
    @State var movieName = ""
    @State var voteRating = 0.0
    
    var body: some View {
        HStack (alignment: .center){
            AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face"+movieImageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 170)
                .background(Color.gray)
                .padding(.top)
                .padding(.bottom)
                .clipped()
            VStack (alignment: .leading){
                Text(movieName)
                        .fontWeight(.semibold)
                        .padding(.leading,2)
                HStack{
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Text( String(format: "%.1f", voteRating))
                        .font(.system(size: 14, weight: .regular))
                        .padding(.top,1)
                }
            }.padding(.horizontal,8)
        
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell()
    }
}
