//
//  MainView.swift
//  matchedgeo
//
//  Created by Nickolay Truhin on 30.11.2021.
//

import Foundation
import SwiftUIX
import SwiftUI

struct MainView: View {
    @Namespace var ns

    @StateObject var vm: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(enumerating: vm.data) { index, item in
                        Button {
                            vm.open(at: index)
                        } label: {
                            CardView(data: item, namespace: ns).zIndex(Double(vm.openedIndex == index || vm.prevOpenedIndex == index ? vm.data.count : index))
                        }
                        
                    }
                }
            }.zIndex(1)

            if let data = vm.openedModel {
                DetailsView(data: data, namespace: ns) {
                    vm.dismiss()
                }.zIndex(2)
            }
        }
    }
}
