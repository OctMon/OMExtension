//
//  OMDictionary.swift
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

public extension Dictionary {
    
    func omRandom() -> (Key, Value) {
        
        let index = Int(arc4random_uniform(UInt32(self.count)))
        
        return (Array(keys)[index], Array(values)[index])
    }
    
    func omContainsKey(_ key: Key) -> Bool {
        
        return index(forKey: key) != nil
    }
    
    func omUnion(_ dictionary: Dictionary...) -> Dictionary {
        
        var result = self
        
        dictionary.forEach { (dict) in
            
            dict.forEach { (key, value) in
                
                result.updateValue(value, forKey: key)
            }
        }
        
        return result
    }
    
    func omMapFilter<K, V>(_ map: (Key, Value) -> (K, V)?) -> [K: V] {
        
        var result = [K: V]()
        
        forEach {
            
            if let value = map($0, $1) {
                
                result[value.0] = value.1
            }
        }
        
        return result
    }
    
    func omFilter(_ valid: (Key, Value) -> Bool) -> Dictionary {
        
        var result = Dictionary()
        
        for (key, value) in self {
            
            if valid(key, value) {
                
                result[key] = value
            }
        }
        
        return result
    }
    
    func omIntersection<K, V>(_ dictionary: [K: V]...) -> [K: V] where K: Equatable, V: Equatable {
        
        let filter = omMapFilter { (key, value) -> (K, V)? in
            
            if let key = key as? K, let value = value as? V {
                
                return (key, value)
            }
            
            return nil
        }
        
        return filter.omFilter { (key: K, value: V) -> Bool in
            
            dictionary.omFilter { $0.omContainsKey(key) && $0[key] == value }
        }
    }
}

public extension Dictionary where Value: Equatable {
    
    func omDifference(_ dictionary: [Key: Value]...) -> [Key: Value] {
        
        var result = self
        
        for dict in dictionary {
            
            for (key, value) in dict {
                
                if result.omContainsKey(key) && result[key] == value {
                    
                    result.removeValue(forKey: key)
                }
            }
        }
        
        return result
    }
}
