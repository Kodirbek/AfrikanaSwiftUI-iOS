//
//  VideoModel.swift
//  Africana
//
//  Created by Abduqodir's MacPro on 2022/06/09.
//

import Foundation
struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
