//
//  OMExtension.swift
//  OMExtension
//
//  Created by OctMon on 2016/11/10.
//  Copyright © 2016年 OctMon. All rights reserved.
//

import Foundation

#if !os(macOS)
    import UIKit
#endif

public protocol OMCompatible {
    
    associatedtype CompatableType
    var om: CompatableType { get }
}

extension OMCompatible {
    
    public var om: OMExtension<Self> {
        
        get {
            return OMExtension(self)
        }
        
        set { }
    }
}

public struct OMExtension<OMBase> {
    
    let base: OMBase
    
    init(_ base: OMBase) {
        self.base = base
    }
}

extension NSObject : OMCompatible { }
