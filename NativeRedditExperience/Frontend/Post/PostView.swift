//
//  PostView.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/11/20.
//

import SwiftUI

struct PostView: View {
    let post: Post?
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: 1, title: "post title", content: "post content"))
    }
}
