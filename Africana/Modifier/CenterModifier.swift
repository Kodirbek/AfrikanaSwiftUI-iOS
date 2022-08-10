//
//  CustomModifier.swift
//  Africana
//
//  Created by Abduqodir's MacPro on 2022/06/10.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
