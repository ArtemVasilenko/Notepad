
import UIKit

class FM {
    let fm = FileManager.default
    let path = "notepad/notes.txt"
    let pathDir = "notepad"
    var url = URL(fileURLWithPath: "")
    var urlDir = URL(fileURLWithPath: "")
    
     func getUrl() {
        
        do {
            self.url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendPathComponent(path)
            print(url)
        } catch {
            print(error)
        }
    }
    
    func createFile() {
        let data: Data? = "kuku".data(using: .utf8)
        fm.createFile(atPath: self.url.path, contents: data)
    }
    
}
