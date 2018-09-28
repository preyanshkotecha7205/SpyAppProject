import Foundation

protocol Cipher
    {
        func encode(_ plaintext: String, secret: String) -> String
        func decode (_ plaintext: String, secret: String) -> String
    }

struct CeaserCipher: Cipher
{

    func encode(_ plaintext: String, secret: String) -> String
    {
        
        if isOnlyAlpha(plaintext)
            {
               var encoded = ""
               if Int32(secret) == nil
                   {
                        return "Invalid Secret Key"
                    }
               var shiftBy = Int32(secret)!
            
               if Int32(secret)! <= -26
                   {
                        shiftBy = Int32(secret)! % -26
                    }
              if Int32(secret)! >= 26
                    {
                        shiftBy = Int32(secret)! % 26
                    }
            let newText = plaintext.uppercased()
            for character in newText
            {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(unicode) + shiftBy
                if (shiftedUnicode < 65)
                {
                    let ShiftingActually = 64 - shiftedUnicode
                    shiftedUnicode = 90 - ShiftingActually
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
            else if (shiftedUnicode > 90)
                {
                    let ShiftingActually = shiftedUnicode - 90
                    shiftedUnicode = 64 + ShiftingActually
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                    continue
                }
            else
                {
                    let shiftedUnicode = Int32(unicode) + shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
        return encoded
        }
            else
            {
                return "Enter only alphabets"
            }
    }
    
    func decode(_ plaintext: String, secret: String) -> String
    {
        if isOnlyAlpha(plaintext)
            {
            var encoded = ""
            if Int32(secret) == nil
                {
                    return "Invalid secret key"
                }
            var shiftBy = Int32(secret)!
            
            if Int32(secret)! <= -26
                {
                    shiftBy = Int32(secret)! % -26
                }
            if Int32(secret)! >= 26
                {
                    shiftBy = Int32(secret)! % 26
                }
            let newText = plaintext.uppercased()
            for character in newText
                {
                    let unicode = character.unicodeScalars.first!.value
                    var shiftedUnicode = Int32(unicode) - shiftBy
                    if (shiftedUnicode < 65) {
                        let ShiftingActually = 64 - shiftedUnicode
                        shiftedUnicode = 90 - ShiftingActually
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        encoded = encoded + shiftedCharacter
                        print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                        continue
                }
                else if (shiftedUnicode > 90)
                    {
                        let ShiftingActually = shiftedUnicode - 90
                        shiftedUnicode = 64 + ShiftingActually
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        encoded = encoded + shiftedCharacter
                        print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                        continue
                    }
                else
                    {
                        let shiftedUnicode = Int32(unicode) + shiftBy
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        encoded = encoded + shiftedCharacter
                        print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                    }
            }
            return encoded
        }
        else
            {
                return "invlaid input , enter only alphabets"
            }
    }
    
    func isOnlyAlpha (_ key: String) -> Bool
        {
            var hasOnlyAlpha = true
            let newKey = key.uppercased()
            for character in newKey {
                if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                    hasOnlyAlpha = false
        }
    }
        return hasOnlyAlpha

    }
}
