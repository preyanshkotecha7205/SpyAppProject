import UIKit

class SpyAppViewController: UIViewController
{

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    let factory = CipherFactory()
    var cipher: Cipher!
    @IBOutlet weak var cipherType: UISegmentedControl!
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
            cipher = CeaserCipher()
        }
    
    
    @IBAction func setType(_ sender: Any)
        {
            
            let ListOfCiphers = ["cesar", "alphanumcesar", "rot", "Autokey"]
            cipher = self.factory.cipher(for: ListOfCiphers[cipherType.selectedSegmentIndex])
            print ("Cipher is: \(ListOfCiphers[cipherType.selectedSegmentIndex])")
        }
    
    
    
    @IBAction func decodeButtonTest(_ sender: Any)
        {
            
            let plaintext = input.text!
            let secret = self.secret.text!
            output.text = cipher.decode(output.text!, secret: secret)
        }
    
    // We will talk about this method during lecture
   
    @IBAction func encodeButtonTest(_ sender: Any)
        {
            
            let plaintext = input.text!
            let secret = self.secret.text!
            output.text = cipher.encode(plaintext, secret: secret)
            
        }
    
    
    
    
}

