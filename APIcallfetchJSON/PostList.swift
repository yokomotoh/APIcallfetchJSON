//
//  PostList.swift
//  APIcallfetchJSON
//
//  Created by vincent schmitt on 02/07/2021.
//

import SwiftUI
import Combine
import Foundation

struct PostList: View {
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts) { post in
            AsyncImage(
                url: URL(string: post.url)!, placeholder: {Text("Loading ...")}
            ).aspectRatio(contentMode: .fit)
            Text(post.title)
        }
        .onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
