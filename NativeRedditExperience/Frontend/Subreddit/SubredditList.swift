//
//  SubredditList.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/11/20.
//

import SwiftUI

struct SubredditList: View {
    let subreddits: [Subreddit]
    var body: some View {
        List(subreddits) {subreddit in
            Text(subreddit.name)
        }
    }
}

struct SubredditList_Previews: PreviewProvider {
    static var previews: some View {
        let subreddits = [
            Subreddit(id: "1", name: "sub1"),
            Subreddit(id: "2", name: "sub2")
        ]
        return SubredditList(subreddits: subreddits)
    }
}
