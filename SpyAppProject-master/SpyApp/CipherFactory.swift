import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] =
        [
            "cesar": CeaserCipher(),
            "alphanumcesar" : AlphaNumericCesarCipher(),
            "rot" : ROT8(),
            "autokey" : Autokey()
        ]

    func cipher(for key: String) -> Cipher
        {
            
            //print (key)
            return ciphers[key]!
        }
    }
