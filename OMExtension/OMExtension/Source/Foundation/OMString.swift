//
//  OMString.swift
//  OMExtension
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 OctMon
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

#if !os(macOS)
    import UIKit
#endif

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

// MARK: - convert

public extension String {
    
    var omToFloat: Float? {
        
        if let num = NumberFormatter().number(from: self) {
            
            return num.floatValue
        }
        
        return nil
    }
    
    var omToFloatValue: Float {
        
        return omToFloat ?? 0
    }
    
    var omToDouble: Double? {
        
        if let num = NumberFormatter().number(from: self) {
            
            return num.doubleValue
        }
        
        return nil
    }
    
    var omToDoubleValue: Double {
        
        return omToDouble ?? 0.0
    }
    
    var omToInt: Int? {
        
        if let num = NumberFormatter().number(from: self) {
            
            return num.intValue
        }
        
        return nil
    }
    
    var omToIntValue: Int {
        
        return omToInt ?? 0
    }
    
    var omToBool: Bool? {
        
        let string = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if string == "true" {
            
            return true
            
        } else if string == "false" {
            
            return false
        }
        
        return nil
    }
    
    var omToBoolValue: Bool {
        
        return omToBool ?? false
    }
    
    /// Date object from "yyyy-MM-dd" formatted string
    var omToDate: Date? {
        
        let selfLowercased = self.omTrimming.lowercased()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.date(from: selfLowercased)
    }
    
    /// Date object from "yyyy-MM-dd HH:mm:ss" formatted string.
    var omToDateTime: Date? {
        
        let selfLowercased = self.omTrimming.lowercased()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.date(from: selfLowercased)
    }

}

// MARK: - base64

// https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
public extension String {
    
    var omBase64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: decodedData, encoding: .utf8)
    }
    
    var omBase64Encoded: String? {
        let plainData = self.data(using: .utf8)
        return plainData?.base64EncodedString()
    }
}

// MARK: - valid

public extension String {
    
    func omIsRegex(_ regex: String) -> Bool {
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return regExPredicate.evaluate(with: self.lowercased())
    }
    
    /// 纯数字验证
    var omIsNumber: Bool { return omIsRegex("^[0-9]*$") }
    
    /// 邮箱验证
    var omIsEmail: Bool { return omIsRegex("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$") }
    
    /// 手机号验证
    var omIsMobile: Bool { return omIsRegex("^(0|86|17951)?(13[0-9]|15[0-9]|17[0-9]|18[0-9]|14[57])[0-9]{8}$") }
    
    /// 电话号码验证
    var omIsPhoneTelephone: Bool { return omIsRegex("([\\d]{7,25}(?!\\d))|((\\d{3,4})-(\\d{7,8}))|((\\d{3,4})-(\\d{7,8})-(\\d{1,4}))") }
    
    /// URL网址验证
    var omIsURL: Bool { return URL(string: self) != nil }
    
    var omIsHttpsUrl: Bool {
        guard lowercased().hasPrefix("https://") else {
            return false
        }
        return URL(string: self) != nil
    }
    
    var omIsHttpUrl: Bool {
        guard lowercased().hasPrefix("http://") else {
            return false
        }
        return URL(string: self) != nil
    }
    
    /// IP地址验证
    var omIsIP: Bool {
        
        if omIsRegex("^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$") {
            
            for string in self.components(separatedBy: ".") {
                
                if string.omToInt > 255 {
                    
                    return false
                }
            }
            
            return true
            
        } else {
            
            return false
        }
    }
    
    /// 身份证号码验证
    var omIsIDCard: Bool {
        
        if characters.count != 18 {
            
            return false
        }
        
        let mmdd = "(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))"
        let leapMmdd = "0229"
        let year = "(19|20)[0-9]{2}"
        let leapYear = "(19|20)(0[48]|[2468][048]|[13579][26])"
        let yearMmdd = year + mmdd
        let leapyearMmdd = leapYear + leapMmdd
        let yyyyMmdd = "((\(yearMmdd))|(\(leapyearMmdd))|(20000229))"
        let area = "(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}"
        let regex = "\(area)\(yyyyMmdd)[0-9]{3}[0-9Xx]"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        if predicate.evaluate(with: self) == false {
            
            return false
        }
        
        let chars = uppercased().characters.map { return String($0) }
        
        let c1 = chars[7].omToInt!
        let c2 = (chars[6].omToInt! + chars[16].omToInt!) * 2
        let c3 = chars[9].omToInt! * 3
        let c4 = (chars[5].omToInt! + chars[15].omToInt!) * 4
        let c5 = (chars[3].omToInt! + chars[13].omToInt!) * 5
        let c6 = chars[8].omToInt! * 6
        let c7 = (chars[0].omToInt! + chars[10].omToInt!) * 7
        let c8 = (chars[4].omToInt! + chars[14].omToInt!) * 8
        let c9 = (chars[1].omToInt! + chars[11].omToInt!) * 9
        let c10 = (chars[2].omToInt! + chars[12].omToInt!) * 10
        
        let summary: Int = c1 + c2 + c3 + c4 + c5 + c6 + c7 + c8 + c9 + c10
        
        let remainder = summary % 11
        let checkString = "10X98765432"
        
        let checkBit = checkString.characters.map { return String($0) }[remainder]
        
        return (checkBit == chars.last)
    }

}

// MARK: - common

public extension String {
    
    var omExtractURL: [URL] {
        
        var urls: [URL] = []
        let detector: NSDataDetector?
        
        do {
            detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        } catch _ as NSError {
            detector = nil
        }
        
        let text = self
        
        if let detector = detector {
            
            detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.characters.count), using: {
                
                (result: NSTextCheckingResult?, flags: NSRegularExpression.MatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                
                if let result = result, let url = result.url {
                    
                    urls.append(url)
                }
            })
        }
        
        return urls
    }
    
    #if os(iOS)
    
    func omCopyToPasteboard() {
        
        UIPasteboard.general.string = self
    }
    
    func omHeight(_ width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode? = nil) -> CGFloat {
        
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        
        if lineBreakMode != nil {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode!
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
        }
        
        let size = CGSize(width: width, height: CGFloat(DBL_MAX))
        
        return ceil((self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }
    
    #endif
    
    mutating func omTrim() {
        
        self = omTrimming
    }
    
    var omTrimming: String {
        
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var omTrimmingWithoutSpacesAndNewLines: String {
        
        return replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    mutating func omReverse() {
        
        self = omReversed
    }
    
    var omReversed: String {
        
        return String(characters.reversed())
    }
    
    var omIsContainEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    func omSplit(_ separator: String) -> [String] {
        
        return components(separatedBy: separator).filter({
            
            return !$0.omTrimming.isEmpty
        })
    }
    
    func omContain(_ subStirng: String, caseSensitive: Bool = true) -> Bool {
        
        if !caseSensitive {
            
            return range(of: subStirng, options: .caseInsensitive) != nil
        }
        
        return range(of: subStirng) != nil
    }
    
    func omCount(of subString: String, caseSensitive: Bool = true) -> Int {
        
        if !caseSensitive {
            
            return lowercased().components(separatedBy: subString).count - 1
        }
        
        return components(separatedBy: subString).count - 1
    }
    
    func omHasPrefix(_ prefix: String, caseSensitive: Bool = true) -> Bool {
        
        if !caseSensitive {
            
            return lowercased().hasPrefix(prefix.lowercased())
        }
        
        return hasPrefix(prefix)
    }
    
    func omHasSuffix(_ suffix: String, caseSensitive: Bool = true) -> Bool {
        
        if !caseSensitive {
            
            return lowercased().hasSuffix(suffix.lowercased())
        }
        
        return hasSuffix(suffix)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `omContain` instead.", renamed: "omContain")
    func omContains(_ subStirng: String, options: NSString.CompareOptions? = nil) -> Bool {
        
        if let options = options {
            
            return range(of: subStirng, options: options) != nil
        }
        
        return range(of: subStirng) != nil
    }
    
    func omJoinSeparator(_ separator: String) -> String {
        
        return characters.map({ "\($0)" }).joined(separator: separator)
    }
    
    mutating func omJoinedSeparatored(_ separator: String) {
        
        self = omJoinSeparator(separator)
    }
    
    func omGetRanges(_ searchString: String) -> [NSRange] {
        
        var start = 0
        var ranges: [NSRange] = []
        
        while true {
            
            let range = (self as NSString).range(of: searchString, options: NSString.CompareOptions.literal, range: NSRange(location: start, length: (self as NSString).length - start))
            
            if range.location == NSNotFound {
                
                break
                
            } else {
                
                ranges.append(range)
                start = range.location + range.length
            }
        }
        
        return ranges
    }
    
    #if !os(macOS)
    
    func omGetAttributes(color: [(color: UIColor, subString: String?)]? = nil, font: [(font: UIFont, subString: String?)]? = nil, underlineStyle: [String]? = nil, strikethroughStyle: [String]? = nil, lineSpacing: CGFloat? = nil) -> NSMutableAttributedString {
        
        let mutableAttributedString = NSMutableAttributedString(string: self)
        
        color?.forEach { (color, subString) in
            
            if let string = subString , string.characters.count > 0 {
                
                for range in omGetRanges(string) {
                    
                    mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
                }
                
            } else {
                
                mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: characters.count))
            }
        }
        
        font?.forEach { (font, subString) in
            
            if let string = subString , string.characters.count > 0 {
                
                for range in omGetRanges(string) {
                    
                    mutableAttributedString.addAttribute(NSFontAttributeName, value: font, range: range)
                }
                
            } else {
                
                mutableAttributedString.addAttribute(NSFontAttributeName, value: font, range: NSRange(location: 0, length: characters.count))
            }
        }
        
        underlineStyle?.forEach { (subString) in
            
            if subString.characters.count > 0 {
                
                for range in omGetRanges(subString) {
                    
                    mutableAttributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range)
                }
            }
        }
        
        strikethroughStyle?.forEach { (subString) in
            
            if subString.characters.count > 0 {
                
                for range in omGetRanges(subString) {
                    
                    mutableAttributedString.addAttribute(NSStrikethroughStyleAttributeName, value: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int), range: range)
                }
            }
        }
        
        if let lineSpacing = lineSpacing {
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpacing
            
            mutableAttributedString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: characters.count))
        }
        
        return mutableAttributedString
    }
    
    #endif

}

// MARK: - MD5 https://github.com/krzyzanowskim/CryptoSwift

public extension String {
    var omMD5: String {
        if let data = self.data(using: .utf8, allowLossyConversion: true) {
            
            let message = data.withUnsafeBytes { bytes -> [UInt8] in
                return Array(UnsafeBufferPointer(start: bytes, count: data.count))
            }
            
            let MD5Calculator = MD5(message)
            let MD5Data = MD5Calculator.calculate()
            
            let MD5String = NSMutableString()
            for c in MD5Data {
                MD5String.appendFormat("%02x", c)
            }
            return MD5String as String
            
        } else {
            return self
        }
    }
}


/** array of bytes, little-endian representation */
func arrayOfBytes<T>(_ value: T, length: Int? = nil) -> [UInt8] {
    let totalBytes = length ?? (MemoryLayout<T>.size * 8)
    
    let valuePointer = UnsafeMutablePointer<T>.allocate(capacity: 1)
    valuePointer.pointee = value
    
    let bytes = valuePointer.withMemoryRebound(to: UInt8.self, capacity: totalBytes) { (bytesPointer) -> [UInt8] in
        var bytes = [UInt8](repeating: 0, count: totalBytes)
        for j in 0..<min(MemoryLayout<T>.size, totalBytes) {
            bytes[totalBytes - 1 - j] = (bytesPointer + j).pointee
        }
        return bytes
    }
    
    valuePointer.deinitialize()
    valuePointer.deallocate(capacity: 1)
    
    return bytes
}

extension Int {
    /** Array of bytes with optional padding (little-endian) */
    func bytes(_ totalBytes: Int = MemoryLayout<Int>.size) -> [UInt8] {
        return arrayOfBytes(self, length: totalBytes)
    }
    
}

extension NSMutableData {
    
    /** Convenient way to append bytes */
    func appendBytes(_ arrayOfBytes: [UInt8]) {
        append(arrayOfBytes, length: arrayOfBytes.count)
    }
    
}

protocol HashProtocol {
    var message: Array<UInt8> { get }
    
    /** Common part for hash calculation. Prepare header data. */
    func prepare(_ len: Int) -> Array<UInt8>
}

extension HashProtocol {
    
    func prepare(_ len: Int) -> Array<UInt8> {
        var tmpMessage = message
        
        // Step 1. Append Padding Bits
        tmpMessage.append(0x80) // append one bit (UInt8 with one bit) to message
        
        // append "0" bit until message length in bits ≡ 448 (mod 512)
        var msgLength = tmpMessage.count
        var counter = 0
        
        while msgLength % len != (len - 8) {
            counter += 1
            msgLength += 1
        }
        
        tmpMessage += Array<UInt8>(repeating: 0, count: counter)
        return tmpMessage
    }
}

func toUInt32Array(_ slice: ArraySlice<UInt8>) -> Array<UInt32> {
    var result = Array<UInt32>()
    result.reserveCapacity(16)
    
    for idx in stride(from: slice.startIndex, to: slice.endIndex, by: MemoryLayout<UInt32>.size) {
        let d0 = UInt32(slice[idx.advanced(by: 3)]) << 24
        let d1 = UInt32(slice[idx.advanced(by: 2)]) << 16
        let d2 = UInt32(slice[idx.advanced(by: 1)]) << 8
        let d3 = UInt32(slice[idx])
        let val: UInt32 = d0 | d1 | d2 | d3
        
        result.append(val)
    }
    return result
}

struct BytesIterator: IteratorProtocol {
    
    let chunkSize: Int
    let data: [UInt8]
    
    init(chunkSize: Int, data: [UInt8]) {
        self.chunkSize = chunkSize
        self.data = data
    }
    
    var offset = 0
    
    mutating func next() -> ArraySlice<UInt8>? {
        let end = min(chunkSize, data.count - offset)
        let result = data[offset..<offset + end]
        offset += result.count
        return result.count > 0 ? result : nil
    }
}

struct BytesSequence: Sequence {
    let chunkSize: Int
    let data: [UInt8]
    
    func makeIterator() -> BytesIterator {
        return BytesIterator(chunkSize: chunkSize, data: data)
    }
}

func rotateLeft(_ value: UInt32, bits: UInt32) -> UInt32 {
    return ((value << bits) & 0xFFFFFFFF) | (value >> (32 - bits))
}

class MD5: HashProtocol {
    
    static let size = 16 // 128 / 8
    let message: [UInt8]
    
    init (_ message: [UInt8]) {
        self.message = message
    }
    
    /** specifies the per-round shift amounts */
    private let shifts: [UInt32] = [7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
                                    5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
                                    4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
                                    6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21]
    
    /** binary integer part of the sines of integers (Radians) */
    private let sines: [UInt32] = [0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
                                   0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
                                   0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
                                   0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
                                   0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
                                   0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
                                   0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
                                   0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                                   0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
                                   0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
                                   0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x4881d05,
                                   0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
                                   0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
                                   0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
                                   0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
                                   0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391]
    
    private let hashes: [UInt32] = [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476]
    
    func calculate() -> [UInt8] {
        var tmpMessage = prepare(64)
        tmpMessage.reserveCapacity(tmpMessage.count + 4)
        
        // hash values
        var hh = hashes
        
        // Step 2. Append Length a 64-bit representation of lengthInBits
        let lengthInBits = (message.count * 8)
        let lengthBytes = lengthInBits.bytes(64 / 8)
        tmpMessage += lengthBytes.reversed()
        
        // Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8 // 64
        
        for chunk in BytesSequence(chunkSize: chunkSizeBytes, data: tmpMessage) {
            // break chunk into sixteen 32-bit words M[j], 0 ≤ j ≤ 15
            var M = toUInt32Array(chunk)
            assert(M.count == 16, "Invalid array")
            
            // Initialize hash value for this chunk:
            var A: UInt32 = hh[0]
            var B: UInt32 = hh[1]
            var C: UInt32 = hh[2]
            var D: UInt32 = hh[3]
            
            var dTemp: UInt32 = 0
            
            // Main loop
            for j in 0 ..< sines.count {
                var g = 0
                var F: UInt32 = 0
                
                switch j {
                case 0...15:
                    F = (B & C) | ((~B) & D)
                    g = j
                    break
                case 16...31:
                    F = (D & B) | (~D & C)
                    g = (5 * j + 1) % 16
                    break
                case 32...47:
                    F = B ^ C ^ D
                    g = (3 * j + 5) % 16
                    break
                case 48...63:
                    F = C ^ (B | (~D))
                    g = (7 * j) % 16
                    break
                default:
                    break
                }
                dTemp = D
                D = C
                C = B
                B = B &+ rotateLeft((A &+ F &+ sines[j] &+ M[g]), bits: shifts[j])
                A = dTemp
            }
            
            hh[0] = hh[0] &+ A
            hh[1] = hh[1] &+ B
            hh[2] = hh[2] &+ C
            hh[3] = hh[3] &+ D
        }
        
        var result = [UInt8]()
        result.reserveCapacity(hh.count / 4)
        
        hh.forEach {
            let itemLE = $0.littleEndian
            result += [UInt8(itemLE & 0xff), UInt8((itemLE >> 8) & 0xff), UInt8((itemLE >> 16) & 0xff), UInt8((itemLE >> 24) & 0xff)]
        }
        return result
    }
}
