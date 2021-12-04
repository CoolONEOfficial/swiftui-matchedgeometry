//
//  CardDataModel.swift
//  matchedgeo
//
//  Created by Nickolay Truhin on 30.11.2021.
//

import Foundation
import SwiftUI

struct CardDataModel {
    let title: String
    let subtitle: String
    let text: String
    let color: Color
}

extension CardDataModel: Identifiable {
    var id: String {
        title
    }
}
