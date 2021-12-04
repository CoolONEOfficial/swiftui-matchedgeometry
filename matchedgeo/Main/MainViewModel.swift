//
//  MainViewModel.swift
//  matchedgeo
//
//  Created by Nickolay Truhin on 30.11.2021.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var data: [CardDataModel] = [
        .init(title: "One", subtitle: "Two", text: .mock, color: .systemTeal),
        .init(title: "2", subtitle: "123", text: .mock, color: .systemGreen),
        .init(title: "3", subtitle: "234", text: .mock, color: .systemBlue),
        .init(title: "4", subtitle: "345", text: .mock, color: .systemRed),
        .init(title: "5", subtitle: "456", text: .mock, color: .systemYellow)
    ]
    @Published private(set) var openedIndex: Int? {
        didSet {
            prevOpenedIndex = oldValue
        }
    }
    private(set) var prevOpenedIndex: Int?

    var openedModel: CardDataModel? {
        guard let openedIndex = openedIndex else {
            return nil
        }
        return data[openedIndex]
    }

    func open(at index: Int) {
        withAnimation {
            openedIndex = index
        }
    }

    func dismiss() {
        withAnimation {
            openedIndex = nil
        }
    }
}
