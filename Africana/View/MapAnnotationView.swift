//
//  MapAnnotationView.swift
//  Africana
//
//  Created by Abduqodir's MacPro on 2022/06/10.
//

import SwiftUI

struct MapAnnotationView: View {
  //MARK: - Properties
  var location: NationalParkLocation
  @State private var animation: Double = 0.0
  
  //MARK: - Body
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 50, height: 50, alignment: .center)
      
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 48, height: 48, alignment: .center)
        .scaleEffect(1 + CGFloat(animation))
        .opacity(1 - animation)
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 45, height: 45, alignment: .center)
      .clipShape(Circle())
    } //: ZStack
    .onAppear {
      withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        animation = 1
      }
    }
  }
}

//MARK: - Preview
struct MapAnnotationView_Previews: PreviewProvider {
  static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
