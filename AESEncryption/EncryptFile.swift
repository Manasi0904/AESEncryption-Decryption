//
//  EncryptFile.swift
//  AESEncryption
//
//  Created by Kumari Mansi on 08/01/25.
//



import Foundation
import CryptoSwift

extension String {
   
func encrypt() -> String? {
        let characterArray: [Character] = self.getCharactersArray()
                let aesKey = String(characterArray)
                
                let ivSlice = aesKey.bytes[0..<16]
                let ivArray = Array(ivSlice)
        do {
            let cipher = try Rabbit(key: aesKey.bytes)
            guard let data = self.data(using: .utf8) else { return nil }
            let encrypted = try cipher.encrypt(data.bytes)
            return Data(encrypted).base64EncodedString()
        } catch {
            print("Encryption failed: \(error)")
            return nil
        }
    }
    
    
    
    func decrypt() -> String? {
        let characterArray: [Character] = self.getCharactersArray()
                let aesKey = String(characterArray)
                
                let ivSlice = aesKey.bytes[0..<16]
                let ivArray = Array(ivSlice)
        do {
            let cipher = try Rabbit(key: aesKey.bytes)
            guard let encryptedData = Data(base64Encoded: self) else { return nil }
            let decryptedBytes = try cipher.decrypt(encryptedData.bytes)
            guard let decryptedString = String(bytes: decryptedBytes, encoding: .utf8) else {1
                return nil
            }
            return decryptedString
        } catch {
            print("Decryption failed: \(error)")
            return nil
        }
    }
    private func getEncryptionKeyEnv() -> [UTF8.CodeUnit] {
                return [0x65, 0x54, 0x48, 0x63, 0x72, 0x74, 0x45, 0x65, 0x54, 0x69, 0x59, 0x53, 0x74, 0x73, 0x4D, 0x65]

        }
    // Function to get Encryption Key
        private func getCharactersArray() -> [Character] {
            
            let obfuscatedBytes: [UInt8] = getEncryptionKeyEnv()
            let swappedBytes = swapValues(obfuscatedBytes)
            let swappedValue = swappedBytes.map{ Character(UnicodeScalar($0)) }
            return Array(swappedValue)
        }
    func swapValues(_ input: [UInt8]) -> [UInt8] {
            var result = input
            for index in stride(from: 0, to: result.count - 1, by: 2) { // Pairwise swapping to get correct order Key
                result.swapAt(index, index + 1)
            }
            return result
        }
}


