//
//  ContentView.swift
//  Mandelbrot-swift
//
//  Created by Peter Richardson on 5/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var log = Log()
    let mandelimage: CGImage(maskWidth: <#T##Int#>, height: <#T##Int#>, bitsPerComponent: <#T##Int#>, bitsPerPixel: <#T##Int#>, bytesPerRow: <#T##Int#>, provider: <#T##CGDataProvider#>, decode: <#T##UnsafePointer<CGFloat>?#>, shouldInterpolate: <#T##Bool#>)
    
    var body: some View {
        VStack {
            // ... other stuff ... images, buttons, etc
            Canvas { context, size in
                context.fill(
                    Path(ellipseIn: CGRect(origin: .zero, size: size)),
                    with: .color(.green))
            }
            .frame(width: 300, height: 200)
            LogView(log)
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
        mandelimage = CGImage(maskWidth: <#T##Int#>, height: <#T##Int#>, bitsPerComponent: <#T##Int#>, bitsPerPixel: <#T##Int#>, bytesPerRow: <#T##Int#>, provider: <#T##CGDataProvider#>, decode: <#T##UnsafePointer<CGFloat>?#>, shouldInterpolate: <#T##Bool#>)
        
        log.println("Ending my app.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
