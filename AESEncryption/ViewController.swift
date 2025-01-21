//
//  ViewController.swift
//  AESEncryption
//
//  Created by Kumari Mansi on 07/01/25.
//



import UIKit
import CryptoSwift

class ViewController: UIViewController {
    
    @IBOutlet var encryptButton: UIButton!
    @IBOutlet var decryptButton: UIButton!
    @IBOutlet var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        //                let testString = "Manasi"
        //
        //                let sha = testString.sha512()
        //                print("SHA-512: \(sha)")
        //
        //
        //                let crc = testString.crc32()
        //                print("crc: \(crc)")
        //
        //                let md5 = testString.md5()
        //                print("md5: \(md5)")
        //
        //
        //
        //
        //                if let aes = try? AES(key: "1234567890123456", iv: "abdefdsrfjdirogf"),
        //                   let aesE = try? aes.encrypt(Array(testString.utf8)) {
        //                    print("AES encrypted: \(aesE)")
        //
        //                    let aesD = try? aes.decrypt(aesE)
        //                    let decrypted = String(bytes: aesD!, encoding: .utf8)
        //                    print("AES decrypted: \(decrypted)")
        
//        
//        do {
//            if let base64cipher = try? Rabbit(key: "1234567890123456") {
//                if let base64 = try testString.encryptToBase64(cipher: base64cipher) {
//                    print("Encrypted Base64: \(base64)")
//                    
//                    
//                    if let decrypted = try base64.decryptBase64ToString(cipher: base64cipher) {
//                        print("Decrypted String: \(decrypted)")
//                    }
//                }
//            }
//        } catch {
//            print("An error occurred: \(error)")
//        }
//        
//        
//    }
//        
   }
    
    
    @IBAction func encryptButton(_ sender: Any) {
        guard let message = textfield.text, !message.isEmpty else {
            print("Please enter a text")
            return
        }
        
        if  let encryptedText = message.encrypt() {
            textfield.text = encryptedText
            print("Encrypted Text: \(encryptedText)")
        }
        else {
            print("Encryption Failed")
        }
        
    }
    
    @IBAction func decryptButton(_ sender: Any) {
        guard let encryptedMessage = textfield.text, !encryptedMessage.isEmpty else {
            print("Please enter a text")
            return
        }
        
        if let decryptedText = encryptedMessage.decrypt() {
            textfield.text = decryptedText
            print("Decrypted Text: \(decryptedText)")
        } else {
            print("Decryption failed.")
        }
    }
}
