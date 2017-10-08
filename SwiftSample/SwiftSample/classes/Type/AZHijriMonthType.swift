//
//  HijriMonthType.swift
//  SwiftSample
//
//  Created by Ali on 10/6/17.
//  Copyright © 2017 Ali Azadeh. All rights reserved.
//

import Foundation
public enum AZHijriMonthType : Int {
    
    case moharam = 1
    case safar = 2
    case rabiAval = 3
    case rabiSani = 4
    case jamadiAval = 5
    case jamadiSani = 6
    case rajab = 7
    case shaban = 8
    case ramadhanKarim = 9
    case shoval = 10
    case ziGhade = 11
    case ziHaje = 12
    
    var description: String {
        switch self {
        case .moharam:
            return "moharam"
        case .safar:
            return "safar"
        case .rabiAval:
            return "rabiAval"
        case .rabiSani:
            return "rabiSani"
        case .jamadiAval:
            return "jamadiAval"
        case .jamadiSani:
            return "jamadiSani"
        case .rajab:
            return "rajab"
        case .shaban:
            return "shaban"
        case .ramadhanKarim:
            return "ramadhanKarim"
        case .shoval:
            return "shoval"
        case .ziGhade:
            return "ziGhade"
        case .ziHaje:
            return "ziHaje"
        }
    }
    
}
