//
//  String+.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation
import CommonCrypto

extension String {
    
    static let empty = ""

    func hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
        let data = Data(bytes: digest, count: digest.count)
        return data.map { String(format: "%02hhx", $0) }.joined()
    }
}

extension Optional where Wrapped == String {
    
    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }
}
