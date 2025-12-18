//
//  ListView.swift
//  ExploringParadiseLost
//
//  Created by 114iosClassStudent04 on 2025/12/8.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination:AuthorView()){
                    HStack(spacing:40){
                        Image("Author")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        Text("Author Info")
                            .font(.title)
                    }
                }
                NavigationLink(destination: CreateBackgroundView()){
                    HStack(spacing:40){
                        Image("Contextual Background Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        Text("Contextual Background ")
                            .font(.title)
                    }
                }
                NavigationLink(destination:FavoriteQuoteView() ){
                    HStack(spacing: 40){
                        Image("Favorite Quote Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        Text("Favorite Quote")
                            .font(.title)
                    }
                }
                
            }
        }
        }
    }


#Preview {
   ListView()
}
