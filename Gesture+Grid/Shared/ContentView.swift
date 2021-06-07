//
//  ContentView.swift
//  Shared
//
//  Created by Yuting Zhong on 6/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var currentScale:CGFloat = 100
    @GestureState private var gestureZoomScale: CGFloat = 1.0
    var zoomScale: CGFloat{
        CGFloat(gestureZoomScale)
    }
    
    let cards = [ "🐶", "🐻", "🐯", "🐙", "👻", "🤡"]
    var body: some View {
        
        ScrollView(.vertical){
            LazyVGrid(columns: zoomedGridColumns(), spacing: 0.0) {
                ForEach(0..<400){index in
                    Card(content: cards[index%cards.count], gestureZoomScale: gestureZoomScale)
                }
            }
            .transition(.opacity)
            .animation(.easeIn(duration: 10))
        }.gesture(
            withAnimation{
                zoomGesture()
            }
        )
        
        
    }
    
    func zoomGesture()-> some Gesture{
        MagnificationGesture()
            .updating($gestureZoomScale) { updatedValue, gestureZoomScale, transection in
                gestureZoomScale = updatedValue
            }
            .onEnded { finalValue in
                currentScale *= finalValue
            }
    }
    
    func zoomedGridColumns()->[GridItem]{
        [GridItem(.adaptive(minimum: currentScale * zoomScale), spacing: 0)]
    }
    
}

struct Card: View{
    
    var content: String
    @GestureState var gestureZoomScale:CGFloat
    @State var currFontSize:CGFloat = 107
    
    
    
    struct CardProperties{
        static let fontScaler = 0.78
    }
    var body: some View{
        

        
        GeometryReader {geometryProxy in
//            let width = geometryProxy.size.width
//            let height = geometryProxy.size.height
            let fontSize = currFontSize * CGFloat(CardProperties.fontScaler)*gestureZoomScale
            
            
            
            
            Text(content)
                .font(.custom("s", size:fontSize))
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
                .transition(.opacity)
                .animation(.easeIn(duration: 1))
                
            
            
            
        }
        .background(Color.red)
        .aspectRatio(2/3, contentMode: .fill)
        .shadow(radius: 10)
        .transition(.opacity)
        .animation(.easeIn(duration: 1))
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
