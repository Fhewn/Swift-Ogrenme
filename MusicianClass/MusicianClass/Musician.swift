//
//  Musician.swift
//  MusicianClass
//
//  Created by Fhewn on 22.10.2025.
//

import Foundation

enum MusicianType {
case LeadGuitar
case BassGuitar
case Drums
case Vocals
}

class Musician {
    
    //Property
    var Name : String = " "
    var Age : Int = 0
    var Instrument : String = " "
    var type : MusicianType
    
    
    //Initializer | (Constructor)
    init(nameInit:String,ageInit:Int,instrumentInit:String,typeInit:MusicianType){
    Name = nameInit
    Age = ageInit
    Instrument = instrumentInit
    type = typeInit
    }
    
    func sing(){
        print("nothing to sing")
    }
    
    private func test() {
        print("test")
    }
}
