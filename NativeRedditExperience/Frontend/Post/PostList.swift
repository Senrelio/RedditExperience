//
//  PostList.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/11/20.
//

import SwiftUI

struct PostList: View {
    let posts: [Post]
    var body: some View {
        ForEach(posts, id: \.id) { post in
            Text(post.title)
        }
    }
}

//struct PostList_Previews: PreviewProvider {
//    static var previews: some View {
//        PostList()
//    }
//}
