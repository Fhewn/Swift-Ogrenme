//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Fhewn on 24.10.2025.
//

import Foundation


class SuperMusician : Musician {
    
    func sing2(){
        print("enter night")
    }
    override func sing(){
        super.sing()
        print("exit light")
    }
}
