//
//  FM.swift
//  Notepad
//
//  Created by Артем on 2/8/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import Foundation

struct FM {
    var fm = FileManager.default
    let path = "notes/note.txt"
    let patchDir = "notes"
    var url = URL(fileURLWithPath: "")
    var urlDir = URL(fileURLWithPath: "")
    
    mutating func getUrl() {
        do {
            url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(path)
            print(url)
        }  catch {
            print(error)
        }
    }
    
    func createFile() {
        let data: Data? = "kuku".data(using: .utf8)
        fm.createFile(atPath: self.url.path, contents: data)
    }
    
    mutating func getUrlDir() {
        do {
            self.urlDir = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(path)
            print(urlDir)
        } catch {
            print(error)
        }
    }
    
    func createDirectory() {
        do {
            try fm.createDirectory(at: urlDir, withIntermediateDirectories: true)
        } catch {
            print(error)
        }
    }
    
}
