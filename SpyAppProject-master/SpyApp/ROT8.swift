//
//  ROT8.swift
//  SpyApp
//
//  Created by Preyansh Kotecha on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation


struct ROT8: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String
    {
        
        if (plaintext.isEmpty || isAlphaNumeric (plaintext) )
            {
                return "Invalid entry"
            }
        
        
        var encoded = ""
        var shiftBy = UInt32("8")!
        
        for character in plaintext
            {
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String
    {
        
        var decoded = ""
        var unShiftBy = UInt32("8")!
        
        for character in plaintext
        {
            
            let unicode = character.unicodeScalars.first!.value
            
            let char = unicode - unShiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(char)))
            decoded = decoded + shiftedCharacter
        }
        
        
        return decoded
    }
    
    func isAlphaNumeric (_ key: String) -> Bool
    {
        
        var hasAlpha = false
        
        var hasNumber = false
        
        let newKey = key.uppercased()
        
        for character in newKey
            {
                
            
            if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90)
                {
                    hasAlpha = true
                }
                
            else
                {
                    if  UInt32(String(character)) != nil
                        {
                            hasNumber = true
                        }
                }
            }
        
        return hasAlpha && hasNumber
        
    }
    
    
    
    
}
