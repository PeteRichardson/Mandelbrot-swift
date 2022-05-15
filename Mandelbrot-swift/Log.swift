
import SwiftUI

class Log: ObservableObject {
    @Published public var text:String = ""
    
    init () {}
    
    func _print(_ message: String) {
        text += message
     }
    func println(_ message: String) {
        text += message + "\n"
    }
    func clear() {
        text = ""
    }

}

struct LogView: View {
    @ObservedObject var log: Log
    
    init (_ log: Log) {
        self.log = log
    }

    var body: some View {
        TextEditor(text: $log.text)
            .font(Font.custom("Hack Nerd Font Mono", size:18))
    }
}
