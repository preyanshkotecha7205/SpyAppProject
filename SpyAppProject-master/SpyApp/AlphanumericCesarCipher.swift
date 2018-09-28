//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Preyansh Kotecha on 9/12/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphaNumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        if (isAlphaNumeric(plaintext))
        {
            if Int32(secret) == nil
            {
                return "Invalid secret code"
            }
           
            var shiftByForChar = Int32(secret)!
            var shiftByForDigit = Int32(secret)!
            if shiftByForChar <= -26
            {
                shiftByForChar = Int32(secret)! % -26
            }
            if shiftByForChar >= 26
            {
                shiftByForChar = Int32(secret)! % 26
            }
            if shiftByForDigit <= -9
            {
                shiftByForDigit = Int32(secret)! % -9
            }
            if shiftByForDigit >= 9
            {
                shiftByForDigit = Int32(secret)! % 9
            }
            let newText = plaintext.uppercased()
        for character in newText
            {
            let unicode = character.unicodeScalars.first!.value
            if isChar(character) {
                var shiftedUnicode = Int32(unicode) + shiftByForChar
                if (shiftedUnicode < 65) {
                    let ShiftingActually = 64 - shiftedUnicode
                     shiftedUnicode = 90 - ShiftingActually
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
            }
                 else if (shiftedUnicode > 90)
                    {
                        let ShiftingActually = shiftedUnicode - 90
                         shiftedUnicode = 64 + ShiftingActually
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        encoded = encoded + shiftedCharacter
                         continue
                    }
                else
                    {
                        let shiftedUnicode = Int32(unicode) + shiftByForChar
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        encoded = encoded + shiftedCharacter
                    }
            }
                else
                {
                var shiftedUnicode = Int32(unicode) + shiftByForDigit
                if (shiftedUnicode < 48) {
                    let ShiftingActually = 47 - shiftedUnicode
                    shiftedUnicode = 57 + ShiftingActually
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                if (shiftedUnicode > 57) {
                    let ShiftingActually = shiftedUnicode - 57
                    shiftedUnicode = 47 + ShiftingActually
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
    }
        else {
            print(plaintext)
            return "invalid alphanumeric entry"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        if (isAlphaNumeric(plaintext)){
            var encoded = ""
            if UInt32(secret) == nil {
                return "Invalid shift key"
            }
            let shiftBy = UInt32(secret)!
            let newText = plaintext.uppercased()
            for character in newText {
                var unicode = character.unicodeScalars.first!.value
                if (String(character) == "Z" && shiftBy > 0){
                    unicode = 64
                }
                if (String(character) == "A" && shiftBy < 0){
                    unicode = 91
                }
                if unicode <= 48 && shiftBy < 0 {
                    unicode = 58
                }
                if unicode <= 57 && shiftBy > 0 {
                    unicode = 47
                }
                let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
        }
        else
        {
            
            print(plaintext)
            return "Invalid AlphaNumeric key"
        }
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
                           continue
                        }
                    else if UInt32(String(character)) != nil
                        {
                           continue
                        }
                    else
                        {
                          return false
                        }
                
            }
        return true

    }
    
    func isChar (_ value: Character) -> Bool
        {
        
        if value.unicodeScalars.first!.value >= 65 && value.unicodeScalars.first!.value <= 90
            {
                return true
            }
        
        return false
    }
    
}

