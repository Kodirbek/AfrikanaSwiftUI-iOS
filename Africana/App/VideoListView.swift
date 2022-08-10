//
//  VideoListView.swift
//  Africana
//
//  Created by Abduqodir's MacPro on 2022/06/09.
//

import SwiftUI

struct VideoListView: View {
  //MARK: - Properties
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  //MARK: - Body
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        } //: Loop
      } //: List
      .listStyle(InsetGroupedListStyle())
      .navigationTitle("Videos")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            // Shuffle videos
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    } //: NavView
  }
}

//MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
