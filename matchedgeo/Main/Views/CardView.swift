//
//  CardView.swift
//  matchedgeo
//
//  Created by Nickolay Truhin on 27.11.2021.
//

import SwiftUI
import SwiftUIX
import PureSwiftUI

struct CardView: View {

    let data: CardDataModel
    let namespace: Namespace.ID

    var body: some View {
        HStack {
            Text(data.title).font(.title).foregroundColor(.label).matchedGeometryEffect(id: "\(data.id)title", in: namespace)
            Spacer()
            Text(data.subtitle).font(.title3).foregroundColor(.label).matchedGeometryEffect(id: "\(data.id)subtitle", in: namespace)
        }.background {
            data.color.matchedGeometryEffect(id: "\(data.id)bg", in: namespace)
        }.padding()
    }
    
}
