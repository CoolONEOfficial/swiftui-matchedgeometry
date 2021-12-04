//
//  DetailsView.swift
//  matchedgeo
//
//  Created by Nickolay Truhin on 27.11.2021.
//

import SwiftUI
import SwiftUIX

struct DetailsView: View {
    
    let data: CardDataModel
    let namespace: Namespace.ID
    let dismissCompletion: () -> Void
    
    @State var isAppeared = false
    
    @State var translationY: CGFloat = 0

    func dismiss() {
        withAnimation {
            isAppeared = false
        }
        dismissCompletion()
    }

    var body: some View {
        VStack {
            HStack {
                Text("Title").font(.largeTitle)
                Spacer()
                Button(action: dismiss) {
                    Circle()
                        .strokeBorder(Color.red, lineWidth: 1)
                        .background(Image(systemName: "xmark").foregroundColor(.red))
                        .frame(width: 50, height: 50)
                }
            }.padding()
            ScrollView {
                Color.clear.height(400)
                VStack(alignment: .leading) {
                    Text(data.title).font(.title).matchedGeometryEffect(id: "\(data.id)title", in: namespace)
                    Text(data.subtitle).font(.title3).matchedGeometryEffect(id: "\(data.id)subtitle", in: namespace)
                }.maxWidth(.infinity).background {
                    data.color.matchedGeometryEffect(id: "\(data.id)bg", in: namespace)
                }.padding()
            }
        }
        .gesture(DragGesture.init(minimumDistance: 0, coordinateSpace: .local).onChanged { val in
            withAnimation(.easeIn(duration: 0.2)) {
                translationY = val.translation.y / 2
            }
        }.onEnded { val in
            withAnimation(.easeIn(duration: 0.2)) {
                translationY = 0
            }
            if abs(val.translation.y) > 50 {
                dismiss()
            }
        })
        .transition(.move(edge: .top).combined(with: .opacity))
        .onAppear {
            withAnimation {
                isAppeared = true
            }
        }.background {
            if isAppeared {
                Spacer().background(.thinMaterial).ignoresSafeArea().transition(.opacity)
            }
        }
        .offset(0, translationY)
    }
}
