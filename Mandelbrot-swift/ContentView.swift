//
//  ContentView.swift
//  Mandelbrot-swift
//
//  Created by Peter Richardson on 5/14/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject private var log = Log()
    var scene: SKScene {
            let scene = SKScene(fileNamed: "Mandelbrot")!
            scene.size = CGSize(width: 1000, height: 750)
            scene.scaleMode = .fill
            return scene
        }

    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(width: 1000, height: 750)
                .ignoresSafeArea()
            LogView(log)
                .frame(width: 1000, height: 400)

            HStack{
                Button("Clear Log") {
                    log.clear()
                }.padding()
                Button("Add to Log") {
                    log.println("Another message!")
                }.padding()
            }
        }.onAppear(perform:_main)
    }
    
    func _main() {
        log.println("Starting my app.")
        // do some calculations, draw some stuff, whatever...
        log.println("Ending my app.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
