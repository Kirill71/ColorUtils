//
//  ColorUtils.swift
//  ColorUtils
//
//  Created by Kyrylo Zharenkov on 3/6/20.
//  Copyright © 2020 Kyrylo Zharenkov. All rights reserved.
//

struct ColorHSL {
    var h: Double
    var s: Double
    var l: Double
}

struct ColorRGBA {
    var r: UInt
    var g: UInt
    var b: UInt
    var a: UInt
    
    static let MaxColorValue = 255.0
}



func convertToRGBA(hsl : ColorHSL) -> ColorRGBA {
   
    if hsl.h == 0.0 {
        let tint = UInt(ColorRGBA.MaxColorValue * hsl.l)
        return ColorRGBA(r: tint, g: tint, b: tint, a: tint)
    }
    
    let q = hsl.l < 0.5 ? hsl.l * (1 + hsl.s) : hsl.l + hsl.s - hsl.l * hsl.s
    let p = 2 * hsl.l - q
    
    func convertToRGBPart( p: Double, q: Double, t: Double) -> Double {
        var t = t
        if t < 0.0 {
            t += 1
        }
        if t > 1 {
            t -= 1
        }
        if t < 1.0 / 6 {
            return p + (q - p) * 6 * t
        }
        if t < 1.0 / 2 {
            return q
        }
        if t < 2.0 / 3 {
            return p + (q - p) * (2.0 / 3 - t ) * 6
        }
        
        return p;
    }
    
    let r = UInt(convertToRGBPart(p: p, q: q, t: hsl.h + 1.0 / 3) * ColorRGBA.MaxColorValue)
    let g = UInt(convertToRGBPart(p: p, q: q, t: hsl.h) * ColorRGBA.MaxColorValue)
    let b = UInt(convertToRGBPart(p: p, q: q, t: hsl.h - 1.0 / 3) * ColorRGBA.MaxColorValue)
    
    return ColorRGBA(r: r, g: g, b: b, a: 0xFF)
}

func convertToHSL(rgba : ColorRGBA) -> ColorHSL {
    
    let r = Double(rgba.r) / ColorRGBA.MaxColorValue
    let g = Double(rgba.g) / ColorRGBA.MaxColorValue
    let b = Double(rgba.b) / ColorRGBA.MaxColorValue
    
    let min = [r,g,b].min(by: {$0 < $1})!
    let max = [r,g,b].max(by: {$0 < $1})!
    
    var hsl = ColorHSL(h: 0.0, s: 0.0, l: Double((min + max) / 2))
    
    let d = max - min
    
    hsl.s = hsl.l > 0.5 ? Double(d / (2 - max - min)) : Double(d / (max + min))
    
    if max == r {
        hsl.h = Double((g - b) / d + ( g < b ? 6 : 0))
    }
    else if max == g {
        hsl.h = Double((b - r) / d + 2)
    }
    else {
        hsl.h = Double((r - g) / d + 4)
    }
    
    hsl.h /= 6
    
    return hsl
}


let rgba = ColorRGBA(r: 43, g: 255, b: 255, a: 255)

let hsl = convertToHSL(rgba: rgba)

let convertedRgba = convertToRGBA(hsl: hsl)

