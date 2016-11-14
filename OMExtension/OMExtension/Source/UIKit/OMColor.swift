//
//  OMColor.swift
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
import UIKit

public extension OMExtension where OMBase: UIColor {
    
    var red: Int {
        
        var r: CGFloat = 0
        base.getRed(&r, green: nil, blue: nil, alpha: nil)
        
        return Int(r * 255)
    }
    
    public var green: Int {
        
        var g: CGFloat = 0
        base.getRed(nil, green: &g, blue: nil, alpha: nil)
        
        return Int(g * 255)
    }
    
    var blue: Int {
        
        var b: CGFloat = 0
        base.getRed(nil, green: nil, blue: &b, alpha: nil)
        
        return Int(b * 255)
    }
    
    var alpha: CGFloat {
        
        var a: CGFloat = 0
        base.getRed(nil, green: nil, blue: nil, alpha: &a)
        
        return a
    }
    
    var isLight: Bool {
        
        var white: CGFloat = 0.0
        base.getWhite(&white, alpha: nil)
        
        return white >= 0.5
    }
}

public extension UIColor {
    
    fileprivate static func colorComponentFrom(_ string: String, start: Int, lenght: Int) -> CGFloat {
        
        var substring: NSString = string as NSString
        substring = substring.substring(with: NSMakeRange(start, lenght)) as NSString
        let fullHex = lenght == 2 ? substring as String : "\(substring)\(substring)"
        var hexComponent: CUnsignedInt = 0
        Scanner(string: fullHex).scanHexInt32(&hexComponent)
        
        return CGFloat(hexComponent) / 255.0
    }
    
    convenience init(omR R: Int, G: Int, B: Int, a: Float = 1.0) {
        
        self.init(red: CGFloat(R) / 255.0, green: CGFloat(G) / 255.0, blue: CGFloat(B) / 255.0, alpha: CGFloat(a))
    }
    
    convenience init(omHex: String) {
        
        let colorString: String = omHex.replacingOccurrences(of: "#", with: "").uppercased()
        var alpha: CGFloat = 0.0, red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        
        switch colorString.characters.count {
        case 3: // #RGB
            alpha = 1.0
            red = UIColor.colorComponentFrom(colorString, start: 0, lenght: 1)
            green = UIColor.colorComponentFrom(colorString, start: 1, lenght: 1)
            blue = UIColor.colorComponentFrom(colorString, start: 2, lenght: 1)
        case 4: // #ARGB
            alpha = UIColor.colorComponentFrom(colorString, start: 0, lenght: 1)
            red = UIColor.colorComponentFrom(colorString, start: 1, lenght: 1)
            green = UIColor.colorComponentFrom(colorString, start: 2, lenght: 1)
            blue = UIColor.colorComponentFrom(colorString, start: 3, lenght: 1)
        case 6: // #RRGGBB
            alpha = 1.0
            red = UIColor.colorComponentFrom(colorString, start: 0, lenght: 2)
            green = UIColor.colorComponentFrom(colorString, start: 2, lenght: 2)
            blue = UIColor.colorComponentFrom(colorString, start: 4, lenght: 2)
        case 8: // #AARRGGBB
            alpha = UIColor.colorComponentFrom(colorString, start: 0, lenght: 2)
            red = UIColor.colorComponentFrom(colorString, start: 2, lenght: 2)
            green = UIColor.colorComponentFrom(colorString, start: 4, lenght: 2)
            blue = UIColor.colorComponentFrom(colorString, start: 6, lenght: 2)
        default:
            break
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    convenience init(omHex: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(((omHex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((omHex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((omHex & 0xFF)) / 255.0, alpha: alpha)
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `color.om.red` instead.", renamed: "om.red")
    var omGetRed: Int {
        
        return om.red
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `color.om.green` instead.", renamed: "om.green")
    public var omGetGreen: Int {
        
        return om.green
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `color.om.blue` instead.", renamed: "om.blue")
    var omGetBlue: Int {
        
        return om.blue
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `color.om.alpha` instead.", renamed: "om.alpha")
    var omGetAlpha: CGFloat {
        
        return om.alpha
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `color.om.isLight` instead.", renamed: "om.isLight")
    var omIsLight: Bool {
        
        return om.isLight
    }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.random` instead.", renamed: "OM.random")
    static var omRandom: UIColor {
        
        return OM.random
    }

}

// MARK: - 中国传统色彩 http://ylbook.com/cms/web/chuantongsecai/chuantongsecai.htm#

public extension UIColor {
    
    struct OM {
        
        public static var random: UIColor {
            
            return UIColor(omR: Int(arc4random_uniform(255)), G: Int(arc4random_uniform(255)), B: Int(arc4random_uniform(255)))
        }
        
        /// 粉红，即浅红色。别称：妃色杨妃色湘妃色妃红色。
        public static var 粉红: UIColor { return UIColor(omHex: 0xFFB3A7) }
        
        /// 妃红色：古同“绯”，粉红色。杨妃色 湘妃色 粉红皆同义。
        public static var 妃色: UIColor { return UIColor(omHex: 0xED5736) }
        
        /// 品红：比大红浅的红色。
        public static var 品红: UIColor { return UIColor(omHex: 0xF00056) }
        
        /// 桃红，桃花的颜色，比粉红略鲜润的颜色。
        public static var 桃红: UIColor { return UIColor(omHex: 0xF47983) }
        
        /// 海棠红，淡紫红色、较桃红色深一些，是非常妩媚娇艳的颜色。
        public static var 海棠红: UIColor { return UIColor(omHex: 0xDB5A6B) }
        
        /// 石榴红：石榴花的颜色，高色度和纯度的红色。
        public static var 石榴红: UIColor { return UIColor(omHex: 0xF20C00) }
        
        /// 樱桃色：鲜红色。
        public static var 樱桃色: UIColor { return UIColor(omHex: 0xC93756) }
        
        /// 银红：银朱和粉红色颜料配成的颜色。多用来形容有光泽的各种红色，尤指有光泽浅红。
        public static var 银红: UIColor { return UIColor(omHex: 0xF05654) }
        
        /// 大红：正红色，三原色中的红，传统的中国红，又称绛色。
        public static var 大红: UIColor { return UIColor(omHex: 0xFF2121) }
        
        /// 绛紫：紫中略带红的颜色。
        public static var 绛紫: UIColor { return UIColor(omHex: 0x8C4356) }
        
        /// 绯红：艳丽的深红。
        public static var 绯红: UIColor { return UIColor(omHex: 0xC83C23) }
        
        /// 胭脂：1，女子装扮时用的胭脂的颜色。 2，国画暗红色颜料。
        public static var 胭脂: UIColor { return UIColor(omHex: 0x9D2933) }
        
        /// 朱红：朱砂的颜色，比大红活泼，也称铅朱朱色丹色。
        public static var 朱红: UIColor { return UIColor(omHex: 0xFF4C00) }
        
        /// 丹：丹砂的鲜艳红色
        public static var 丹: UIColor { return UIColor(omHex: 0xFF4E20) }
        
        /// 彤：赤色。
        public static var 彤: UIColor { return UIColor(omHex: 0xF35336) }
        
        /// 茜色：茜草染的色彩，呈深红色。
        public static var 茜色: UIColor { return UIColor(omHex: 0xCB3A56) }
        
        /// 火红：火焰的红色，赤色。
        public static var 火红: UIColor { return UIColor(omHex: 0xFF2D51) }
        
        /// 赫赤：深红，火红。泛指赤色、火红色。
        public static var 赫赤: UIColor { return UIColor(omHex: 0xC91F37) }
        
        /// 嫣红：鲜艳的红色。
        public static var 嫣红: UIColor { return UIColor(omHex: 0xEF7A82) }
        
        /// 洋红：色橘红。
        public static var 洋红: UIColor { return UIColor(omHex: 0xFF0097) }
        
        /// 炎：引申为红色。
        public static var 炎: UIColor { return UIColor(omHex: 0xFF3300) }
        
        /// 赤：本义火的颜色，即红色。
        public static var 赤: UIColor { return UIColor(omHex: 0xC3272B) }
        
        /// 绾：绛色；浅绛色。
        public static var 绾: UIColor { return UIColor(omHex: 0xA98175) }
        
        /// 枣红：即深红。
        public static var 枣红: UIColor { return UIColor(omHex: 0xC32136) }
        
        /// 檀：浅红色，浅绛色。
        public static var 檀: UIColor { return UIColor(omHex: 0xB36D61) }
        
        /// 殷红：发黑的红色。
        public static var 殷红: UIColor { return UIColor(omHex: 0xBE002F) }
        
        /// 酡红：像饮酒后脸上泛现的红色，泛指脸红。
        public static var 酡红: UIColor { return UIColor(omHex: 0xDC3023) }
        
        /// 酡颜：饮酒脸红的样子，亦泛指脸红色。
        public static var 酡颜: UIColor { return UIColor(omHex: 0xF9906F) }
        
        /// 鹅黄：淡黄色。
        public static var 鹅黄: UIColor { return UIColor(omHex: 0xFFF143) }
        
        /// 鸭黄：小鸭毛的黄色。
        public static var 鸭黄: UIColor { return UIColor(omHex: 0xFAFF72) }
        
        /// 樱草色：淡黄色。
        public static var 樱草色: UIColor { return UIColor(omHex: 0xEAFF56) }
        
        /// 杏黄：成熟杏子的黄色。
        public static var 杏黄: UIColor { return UIColor(omHex: 0xFFA631) }
        
        /// 杏红：成熟杏子偏红色的一种颜色。
        public static var 杏红: UIColor { return UIColor(omHex: 0xFF8C31) }
        
        /// 橘黄：柑橘的黄色。
        public static var 橘黄: UIColor { return UIColor(omHex: 0xFF8936) }
        
        /// 橙黄：橙的黄色。（现代感比较强，广告上用得较多）
        public static var 橙黄: UIColor { return UIColor(omHex: 0xFFA400) }
        
        /// 橘红：柑橘皮所呈现的红色。
        public static var 橘红: UIColor { return UIColor(omHex: 0xFF7500) }
        
        /// 姜黄：中药名，别名黄姜，为姜科植物姜黄的根茎。又指人脸色不正，呈黄白色。
        public static var 姜黄: UIColor { return UIColor(omHex: 0xFFC773) }
        
        /// 缃色：浅黄色。
        public static var 缃色: UIColor { return UIColor(omHex: 0xF0C239) }
        
        /// 橙色：界于红色和黄色之间的混合色。
        public static var 橙色: UIColor { return UIColor(omHex: 0xFA8C35) }
        
        /// 茶色：一种比栗色稍红的棕橙色至浅棕色。
        public static var 茶色: UIColor { return UIColor(omHex: 0xB35C44) }
        
        /// 驼色：一种比哢叽色稍红而微淡、比肉桂色黄而稍淡和比核桃棕色黄而暗的浅黄棕色。
        public static var 驼色: UIColor { return UIColor(omHex: 0xA88462) }
        
        /// 昏黄：形容天色、灯光等呈幽暗的黄色。
        public static var 昏黄: UIColor { return UIColor(omHex: 0xC89B40) }
        
        /// 栗色：栗壳的颜色，即紫黑色。
        public static var 栗色: UIColor { return UIColor(omHex: 0x60281E) }
        
        /// 棕色：棕毛的颜色,即褐色。 1，在红色和黄色之间的任何一种颜色 2，适中的暗淡和适度的浅黑。
        public static var 棕色: UIColor { return UIColor(omHex: 0xB25D25) }
        
        /// 棕绿：绿中泛棕色的一种颜色。
        public static var 棕绿: UIColor { return UIColor(omHex: 0x827100) }
        
        /// 棕黑：深​​棕色。
        public static var 棕黑: UIColor { return UIColor(omHex: 0x7C4B00) }
        
        /// 棕红：红褐色。
        public static var 棕红: UIColor { return UIColor(omHex: 0x9B4400) }
        
        /// 棕黄：浅褐色。
        public static var 棕黄: UIColor { return UIColor(omHex: 0xAE7000) }
        
        /// 赭色：红色、赤红色。古人用以饰面。
        public static var 赭色: UIColor { return UIColor(omHex: 0x955539) }
        
        /// 枯黄：干枯焦黄。
        public static var 枯黄: UIColor { return UIColor(omHex: 0xD3B17D) }
        
        /// 黄栌：一种落叶灌木，花黄绿色，叶子秋天变成红色，木材黄色可做染料。
        public static var 黄栌: UIColor { return UIColor(omHex: 0xE29C45) }
        
        /// 秋色：1，中常橄榄棕色，它比一般橄榄棕色稍暗，且稍稍绿些。 2，古以秋为金，其色白，故代指白色。
        public static var 秋色: UIColor { return UIColor(omHex: 0x896C39) }
        
        /// 秋香色：浅橄榄色浅黄绿色。（注：直接在Y中掺入k10~30可得到不同浓淡的该类色彩）
        public static var 秋香色: UIColor { return UIColor(omHex: 0xD9B611) }
        
        /// 嫩绿：像刚长出的嫩叶的浅绿色。
        public static var 嫩绿: UIColor { return UIColor(omHex: 0xBDDD22) }
        
        /// 柳黄：像柳树芽那样的浅黄色。
        public static var 柳黄: UIColor { return UIColor(omHex: 0xC9DD22) }
        
        /// 柳绿：柳叶的青绿色。
        public static var 柳绿: UIColor { return UIColor(omHex: 0xAFDD22) }
        
        /// 竹青：竹子的绿色。
        public static var 竹青: UIColor { return UIColor(omHex: 0x789262) }
        
        /// 葱黄：黄绿色，嫩黄色。
        public static var 葱黄: UIColor { return UIColor(omHex: 0xA3D900) }
        
        /// 葱绿：1，浅绿又略显微黄的颜色 2，草木青翠的样子。
        public static var 葱绿: UIColor { return UIColor(omHex: 0x9ED900) }
        
        /// 葱青：淡淡的青绿色。
        public static var 葱青: UIColor { return UIColor(omHex: 0x0EB83A) }
        
        /// 青葱：翠绿色，形容植物浓绿。
        public static var 青葱: UIColor { return UIColor(omHex: 0x0AA344) }
        
        /// 油绿：光润而浓绿的颜色。
        public static var 油绿: UIColor { return UIColor(omHex: 0x00BC12) }
        
        /// 绿沉：深绿。
        public static var 绿沉: UIColor { return UIColor(omHex: 0x0C8918) }
        
        /// 碧色：1，青绿色。 2，青白色，浅蓝色。
        public static var 碧色: UIColor { return UIColor(omHex: 0x1BD1A5) }
        
        /// 碧绿：鲜艳的青绿色。
        public static var 碧绿: UIColor { return UIColor(omHex: 0x2ADD9C) }
        
        /// 青碧：鲜艳的青蓝色。
        public static var 青碧: UIColor { return UIColor(omHex: 0x48C0A3) }
        
        /// 翡翠色：1，翡翠鸟羽毛的青绿色。 2，翡翠宝石的颜色。 (注：C-Y≧30 的系列色彩，多与白色配合以体现清新明丽感觉，与黑色配合效果不好：该色个性柔弱，会被黑色牵制)
        public static var 翡翠色: UIColor { return UIColor(omHex: 0x3DE1AD) }
        
        /// 草绿：绿而略黄的颜色。
        public static var 草绿: UIColor { return UIColor(omHex: 0x40DE5A) }
        
        /// 青色：1，一类带绿的蓝色，中等深浅，高度饱和。 3，本义是蓝色。 4，一般指深绿色。 5，也指黑色。 6，四色印刷中的一色。 2，特指三补色中的一色。
        public static var 青色: UIColor { return UIColor(omHex: 0x00E09E) }
        
        /// 青翠：鲜绿。
        public static var 青翠: UIColor { return UIColor(omHex: 0x00E079) }
        
        /// 青白：白而发青,尤指脸没有血色。
        public static var 青白: UIColor { return UIColor(omHex: 0xC0EBD7) }
        
        /// 鸭卵青：淡青灰色，极淡的青绿色。
        public static var 鸭卵青: UIColor { return UIColor(omHex: 0xE0EEE8) }
        
        /// 蟹壳青：深灰绿色。
        public static var 蟹壳青: UIColor { return UIColor(omHex: 0xBBCDC5) }
        
        /// 鸦青：鸦羽的颜色。即黑而带有紫绿光的颜色。
        public static var 鸦青: UIColor { return UIColor(omHex: 0x424C50) }
        
        /// 绿色：1，在光谱中介于蓝与黄之间的那种颜色。 2，本义：青中带黄的颜色。 3，引申为黑色，如绿鬓：乌黑而光亮的鬓发。代指为青春年少的容颜。
        public static var 绿色: UIColor { return UIColor(omHex: 0x00E500) }
        
        /// 豆绿：浅黄绿色。
        public static var 豆绿: UIColor { return UIColor(omHex: 0x9ED048) }
        
        /// 豆青：浅青绿色。
        public static var 豆青: UIColor { return UIColor(omHex: 0x96CE54) }
        
        /// 石青：淡灰绿色。
        public static var 石青: UIColor { return UIColor(omHex: 0x7BCFA6) }
        
        /// 玉色：玉的颜色，高雅的淡绿、淡青色
        public static var 玉色: UIColor { return UIColor(omHex: 0x7BCFA6) }
        
        /// 缥：绿色而微白。
        public static var 缥: UIColor { return UIColor(omHex: 0x7FECAD) }
        
        /// 艾绿：艾草的颜色，偏苍白的绿色。
        public static var 艾绿: UIColor { return UIColor(omHex: 0xA4E2C6) }
        
        /// 松柏绿：经冬松柏叶的深绿。
        public static var 松柏绿: UIColor { return UIColor(omHex: 0x21A675) }
        
        /// 松花绿：亦作“松花”、“松绿”。偏黑的深绿色,墨绿。
        public static var 松花绿: UIColor { return UIColor(omHex: 0x057748) }
        
        /// 松花色：浅黄绿色。（松树花粉的颜色）《红楼梦》中提及松花配桃红为娇艳
        public static var 松花色: UIColor { return UIColor(omHex: 0xBCE672) }
        
        /// 蓝：三原色的一种。像晴天天空的颜色（注：这里的蓝色指的不是RGB色彩中的B，而是CMY色彩中的C）
        public static var 蓝: UIColor { return UIColor(omHex: 0x44CEF6) }
        
        /// 靛青：也叫“蓝靛”。用蓼蓝叶泡水调和与石灰沉淀所得的蓝色染料。呈深蓝绿色 （注：有些地方将蓝墨水称为“靛水”或者“兰靛水”）
        public static var 靛青: UIColor { return UIColor(omHex: 0x177CB0) }
        
        /// 靛蓝：由植物(例如靛蓝或菘蓝属植物)得到的蓝色染料。
        public static var 靛蓝: UIColor { return UIColor(omHex: 0x065279) }
        
        /// 碧蓝：青蓝色。
        public static var 碧蓝: UIColor { return UIColor(omHex: 0x3EEDE7) }
        
        /// 蔚蓝：类似晴朗天空的颜色的一种蓝色。
        public static var 蔚蓝: UIColor { return UIColor(omHex: 0x70F3FF) }
        
        /// 宝蓝：鲜艳明亮的蓝色（注：英文中为RoyalBlue 即皇家蓝色，是皇室选用的色彩，多和小面积纯黄色（金色）配合使用。）
        public static var 宝蓝: UIColor { return UIColor(omHex: 0x4B5CC4) }
        
        /// 蓝灰色：一种近于灰略带蓝的深灰色。
        public static var 蓝灰色: UIColor { return UIColor(omHex: 0xA1AFC9) }
        
        /// 藏青：蓝而近黑。
        public static var 藏青: UIColor { return UIColor(omHex: 0x2E4E7E) }
        
        /// 藏蓝：蓝里略透红色。
        public static var 藏蓝: UIColor { return UIColor(omHex: 0x3B2E7E) }
        
        /// 黛：青黑色的颜料。古代女子用以画眉。
        public static var 黛: UIColor { return UIColor(omHex: 0x4A4266) }
        
        /// 黛绿：墨绿。
        public static var 黛绿: UIColor { return UIColor(omHex: 0x426666) }
        
        /// 黛蓝：深蓝色。
        public static var 黛蓝: UIColor { return UIColor(omHex: 0x425066) }
        
        /// 黛紫：深紫色
        public static var 黛紫: UIColor { return UIColor(omHex: 0x574266) }
        
        /// 紫色：蓝和红组成的颜色。古人以紫为祥瑞的颜色。代指与帝王、皇宫有关的事物。
        public static var 紫色: UIColor { return UIColor(omHex: 0x8D4BBB) }
        
        /// 紫酱：浑浊的紫色。
        public static var 紫酱: UIColor { return UIColor(omHex: 0x815463) }
        
        /// 酱紫：紫中略带红的颜色。
        public static var 酱紫: UIColor { return UIColor(omHex: 0x815476) }
        
        /// 紫檀：檀木的颜色，也称乌檀色乌木色。
        public static var 紫檀: UIColor { return UIColor(omHex: 0x4C221B) }
        
        /// 绀青绀紫：纯度较低的深紫色。
        public static var 绀青: UIColor { return UIColor(omHex: 0x003371) }
        
        /// 紫棠：黑红色。
        public static var 紫棠: UIColor { return UIColor(omHex: 0x56004F) }
        
        /// 青莲：偏蓝的紫色。
        public static var 青莲: UIColor { return UIColor(omHex: 0x801DAE) }
        
        /// 群青：深蓝色。
        public static var 群青: UIColor { return UIColor(omHex: 0x4C8DAE) }
        
        /// 雪青：浅蓝紫色。
        public static var 雪青: UIColor { return UIColor(omHex: 0xB0A4E3) }
        
        /// 丁香色：紫丁香的颜色，浅浅的紫色，很娇柔淡雅的色彩。
        public static var 丁香色: UIColor { return UIColor(omHex: 0xCCA4E3) }
        
        /// 藕色：浅灰而略带红的颜色。
        public static var 藕色: UIColor { return UIColor(omHex: 0xEDD1D8) }
        
        /// 苍色：即各种颜色掺入黑色后的颜色，如苍翠。
        public static var 苍色: UIColor { return UIColor(omHex: 0x75878A) }
        
        /// 苍黄
        public static var 苍黄: UIColor { return UIColor(omHex: 0x519A73) }
        
        /// 苍青
        public static var 苍青: UIColor { return UIColor(omHex: 0xA29B7C) }
        
        /// 苍黑
        public static var 苍黑: UIColor { return UIColor(omHex: 0x7397AB) }
        
        /// 苍白
        public static var 苍白: UIColor { return UIColor(omHex: 0xD1D9E0) }
        
        /// 水色
        public static var 水色: UIColor { return UIColor(omHex: 0x88ADA6) }
        
        /// 水红
        public static var 水红: UIColor { return UIColor(omHex: 0xF3D3E7) }
        
        /// 水绿
        public static var 水绿: UIColor { return UIColor(omHex: 0xD4F2E7) }
        
        /// 水蓝
        public static var 水蓝: UIColor { return UIColor(omHex: 0xD2F0F4) }
        
        /// 淡青
        public static var 淡青: UIColor { return UIColor(omHex: 0xD3E0F3) }
        
        /// 湖蓝
        public static var 湖蓝: UIColor { return UIColor(omHex: 0x30DFF3) }
        
        /// 湖绿
        public static var 湖绿: UIColor { return UIColor(omHex: 0x25F8CB) }
        
        /// 精白
        public static var 精白: UIColor { return UIColor(omHex: 0xFFFFFF) }
        
        /// 像牙白：乳白色。
        public static var 像牙白: UIColor { return UIColor(omHex: 0xFFFBF0) }
        
        /// 雪白：如雪般洁白。
        public static var 雪白: UIColor { return UIColor(omHex: 0xF0FCFF) }
        
        /// 月白：淡蓝色。
        public static var 月白: UIColor { return UIColor(omHex: 0xD6ECF0) }
        
        /// 缟：白色。
        public static var 缟: UIColor { return UIColor(omHex: 0xF2ECDE) }
        
        /// 素：白色，无色。
        public static var 素: UIColor { return UIColor(omHex: 0xE0F0E9) }
        
        /// 荼白：如荼之白色。
        public static var 荼白: UIColor { return UIColor(omHex: 0xF3F9F1) }
        
        /// 霜色：白霜的颜色。
        public static var 霜色: UIColor { return UIColor(omHex: 0xE9F1F6) }
        
        /// 花白：白色和黑色混杂的。斑白的 夹杂有灰色的白。
        public static var 花白: UIColor { return UIColor(omHex: 0xC2CCD0) }
        
        /// 鱼肚白：似鱼腹部的颜色，多指黎明时东方的天色颜色。
        public static var 鱼肚白: UIColor { return UIColor(omHex: 0xFCEFE8) }
        
        /// 莹白：晶莹洁白。
        public static var 莹白: UIColor { return UIColor(omHex: 0xE3F9FD) }
        
        /// 灰色：黑色和白色混和成的一种颜色。
        public static var 灰色: UIColor { return UIColor(omHex: 0x808080) }
        
        /// 牙色：与像牙相似的淡黄色。（注：暖白）
        public static var 牙色: UIColor { return UIColor(omHex: 0xEEDEB0) }
        
        /// 铅白：铅粉的白色。铅粉，国画颜料，日久易氧化“返铅”变黑。铅粉在古时用以搽脸的化妆品。（注：冷白）
        public static var 铅白: UIColor { return UIColor(omHex: 0xF0F0F4) }
        
        /// 玄色：赤黑色，黑中带红的颜色，又泛指黑色。
        public static var 玄色: UIColor { return UIColor(omHex: 0x622A1D) }
        
        /// 玄青：深黑色。
        public static var 玄青: UIColor { return UIColor(omHex: 0x3D3B4F) }
        
        /// 乌色：暗而呈黑的颜色。
        public static var 乌色: UIColor { return UIColor(omHex: 0x725E82) }
        
        /// 乌黑：深黑。
        public static var 乌黑: UIColor { return UIColor(omHex: 0x392F41) }
        
        /// 漆黑：非常黑的。
        public static var 漆黑: UIColor { return UIColor(omHex: 0x161823) }
        
        /// 墨色：即黑色。
        public static var 墨色: UIColor { return UIColor(omHex: 0x50616D) }
        
        /// 墨灰：即黑灰。
        public static var 墨灰: UIColor { return UIColor(omHex: 0x758A99) }
        
        /// 黑色：亮度最低的非彩色的或消色差的物体的颜色；最暗的灰色；被认为特别属于那些既不能反射、又不能透过能使人感觉到的微小入射光的物体,任何亮度很低的物体颜色。
        public static var 黑色: UIColor { return UIColor(omHex: 0x000000) }
        
        /// 缁色：帛黑色。
        public static var 缁色: UIColor { return UIColor(omHex: 0x493131) }
        
        /// 煤黑像牙黑：都是黑，不过有冷暖之分。
        public static var 煤黑: UIColor { return UIColor(omHex: 0x312520) }
        
        /// 黧：黑中带黄的颜色。
        public static var 黧: UIColor { return UIColor(omHex: 0x5D513C) }
        
        /// 黎：黑中带黄似黎草色。
        public static var 黎: UIColor { return UIColor(omHex: 0x75664D) }
        
        /// 黝：本义为淡黑色或微青黑色。
        public static var 黝: UIColor { return UIColor(omHex: 0x6B6882) }
        
        /// 黝黑：（皮肤暴露在太阳光下而晒成的）青黑色。
        public static var 黝黑: UIColor { return UIColor(omHex: 0x665757) }
        
        /// 黯：深黑色、泛指黑色。
        public static var 黯: UIColor { return UIColor(omHex: 0x41555D) }
        
        /// 赤金：足金的颜色。
        public static var 赤金: UIColor { return UIColor(omHex: 0xF2BE45) }
        
        /// 金色：平均为深黄色带光泽的颜色。
        public static var 金色: UIColor { return UIColor(omHex: 0xEACD76) }
        
        /// 银白：带银光的白色。
        public static var 银白: UIColor { return UIColor(omHex: 0xE9E7EF) }
        
        /// 铜绿
        public static var 铜绿: UIColor { return UIColor(omHex: 0x549688) }
        
        /// 乌金
        public static var 乌金: UIColor { return UIColor(omHex: 0xA78E44) }
        
        /// 老银：金属氧化后的色彩。
        public static var 老银: UIColor { return UIColor(omHex: 0xBACAC6) }
    }
    
}

public extension UIColor {
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 粉红，即浅红色。别称：妃色杨妃色湘妃色妃红色。
    static var omChinese粉红: UIColor { return UIColor(omHex: 0xFFB3A7) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 妃红色：古同“绯”，粉红色。杨妃色 湘妃色 粉红皆同义。
    static var omChinese妃色: UIColor { return UIColor(omHex: 0xED5736) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 品红：比大红浅的红色。
    static var omChinese品红: UIColor { return UIColor(omHex: 0xF00056) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 桃红，桃花的颜色，比粉红略鲜润的颜色。
    static var omChinese桃红: UIColor { return UIColor(omHex: 0xF47983) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 海棠红，淡紫红色、较桃红色深一些，是非常妩媚娇艳的颜色。
    static var omChinese海棠红: UIColor { return UIColor(omHex: 0xDB5A6B) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 石榴红：石榴花的颜色，高色度和纯度的红色。
    static var omChinese石榴红: UIColor { return UIColor(omHex: 0xF20C00) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 樱桃色：鲜红色。
    static var omChinese樱桃色: UIColor { return UIColor(omHex: 0xC93756) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 银红：银朱和粉红色颜料配成的颜色。多用来形容有光泽的各种红色，尤指有光泽浅红。
    static var omChinese银红: UIColor { return UIColor(omHex: 0xF05654) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 大红：正红色，三原色中的红，传统的中国红，又称绛色。
    static var omChinese大红: UIColor { return UIColor(omHex: 0xFF2121) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绛紫：紫中略带红的颜色。
    static var omChinese绛紫: UIColor { return UIColor(omHex: 0x8C4356) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绯红：艳丽的深红。
    static var omChinese绯红: UIColor { return UIColor(omHex: 0xC83C23) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 胭脂：1，女子装扮时用的胭脂的颜色。 2，国画暗红色颜料。
    static var omChinese胭脂: UIColor { return UIColor(omHex: 0x9D2933) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 朱红：朱砂的颜色，比大红活泼，也称铅朱朱色丹色。
    static var omChinese朱红: UIColor { return UIColor(omHex: 0xFF4C00) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 丹：丹砂的鲜艳红色
    static var omChinese丹: UIColor { return UIColor(omHex: 0xFF4E20) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 彤：赤色。
    static var omChinese彤: UIColor { return UIColor(omHex: 0xF35336) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 茜色：茜草染的色彩，呈深红色。
    static var omChinese茜色: UIColor { return UIColor(omHex: 0xCB3A56) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 火红：火焰的红色，赤色。
    static var omChinese火红: UIColor { return UIColor(omHex: 0xFF2D51) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 赫赤：深红，火红。泛指赤色、火红色。
    static var omChinese赫赤: UIColor { return UIColor(omHex: 0xC91F37) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 嫣红：鲜艳的红色。
    static var omChinese嫣红: UIColor { return UIColor(omHex: 0xEF7A82) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 洋红：色橘红。
    static var omChinese洋红: UIColor { return UIColor(omHex: 0xFF0097) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 炎：引申为红色。
    static var omChinese炎: UIColor { return UIColor(omHex: 0xFF3300) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 赤：本义火的颜色，即红色。
    static var omChinese赤: UIColor { return UIColor(omHex: 0xC3272B) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绾：绛色；浅绛色。
    static var omChinese绾: UIColor { return UIColor(omHex: 0xA98175) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 枣红：即深红。
    static var omChinese枣红: UIColor { return UIColor(omHex: 0xC32136) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 檀：浅红色，浅绛色。
    static var omChinese檀: UIColor { return UIColor(omHex: 0xB36D61) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 殷红：发黑的红色。
    static var omChinese殷红: UIColor { return UIColor(omHex: 0xBE002F) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 酡红：像饮酒后脸上泛现的红色，泛指脸红。
    static var omChinese酡红: UIColor { return UIColor(omHex: 0xDC3023) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 酡颜：饮酒脸红的样子，亦泛指脸红色。
    static var omChinese酡颜: UIColor { return UIColor(omHex: 0xF9906F) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 鹅黄：淡黄色。
    static var omChinese鹅黄: UIColor { return UIColor(omHex: 0xFFF143) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 鸭黄：小鸭毛的黄色。
    static var omChinese鸭黄: UIColor { return UIColor(omHex: 0xFAFF72) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 樱草色：淡黄色。
    static var omChinese樱草色: UIColor { return UIColor(omHex: 0xEAFF56) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 杏黄：成熟杏子的黄色。
    static var omChinese杏黄: UIColor { return UIColor(omHex: 0xFFA631) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 杏红：成熟杏子偏红色的一种颜色。
    static var omChinese杏红: UIColor { return UIColor(omHex: 0xFF8C31) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 橘黄：柑橘的黄色。
    static var omChinese橘黄: UIColor { return UIColor(omHex: 0xFF8936) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 橙黄：橙的黄色。（现代感比较强，广告上用得较多）
    static var omChinese橙黄: UIColor { return UIColor(omHex: 0xFFA400) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 橘红：柑橘皮所呈现的红色。
    static var omChinese橘红: UIColor { return UIColor(omHex: 0xFF7500) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 姜黄：中药名，别名黄姜，为姜科植物姜黄的根茎。又指人脸色不正，呈黄白色。
    static var omChinese姜黄: UIColor { return UIColor(omHex: 0xFFC773) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 缃色：浅黄色。
    static var omChinese缃色: UIColor { return UIColor(omHex: 0xF0C239) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 橙色：界于红色和黄色之间的混合色。
    static var omChinese橙色: UIColor { return UIColor(omHex: 0xFA8C35) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 茶色：一种比栗色稍红的棕橙色至浅棕色。
    static var omChinese茶色: UIColor { return UIColor(omHex: 0xB35C44) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 驼色：一种比哢叽色稍红而微淡、比肉桂色黄而稍淡和比核桃棕色黄而暗的浅黄棕色。
    static var omChinese驼色: UIColor { return UIColor(omHex: 0xA88462) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 昏黄：形容天色、灯光等呈幽暗的黄色。
    static var omChinese昏黄: UIColor { return UIColor(omHex: 0xC89B40) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 栗色：栗壳的颜色，即紫黑色。
    static var omChinese栗色: UIColor { return UIColor(omHex: 0x60281E) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 棕色：棕毛的颜色,即褐色。 1，在红色和黄色之间的任何一种颜色 2，适中的暗淡和适度的浅黑。
    static var omChinese棕色: UIColor { return UIColor(omHex: 0xB25D25) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 棕绿：绿中泛棕色的一种颜色。
    static var omChinese棕绿: UIColor { return UIColor(omHex: 0x827100) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 棕黑：深​​棕色。
    static var omChinese棕黑: UIColor { return UIColor(omHex: 0x7C4B00) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 棕红：红褐色。
    static var omChinese棕红: UIColor { return UIColor(omHex: 0x9B4400) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 棕黄：浅褐色。
    static var omChinese棕黄: UIColor { return UIColor(omHex: 0xAE7000) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 赭色：红色、赤红色。古人用以饰面。
    static var omChinese赭色: UIColor { return UIColor(omHex: 0x955539) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 枯黄：干枯焦黄。
    static var omChinese枯黄: UIColor { return UIColor(omHex: 0xD3B17D) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黄栌：一种落叶灌木，花黄绿色，叶子秋天变成红色，木材黄色可做染料。
    static var omChinese黄栌: UIColor { return UIColor(omHex: 0xE29C45) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 秋色：1，中常橄榄棕色，它比一般橄榄棕色稍暗，且稍稍绿些。 2，古以秋为金，其色白，故代指白色。
    static var omChinese秋色: UIColor { return UIColor(omHex: 0x896C39) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 秋香色：浅橄榄色浅黄绿色。（注：直接在Y中掺入k10~30可得到不同浓淡的该类色彩）
    static var omChinese秋香色: UIColor { return UIColor(omHex: 0xD9B611) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 嫩绿：像刚长出的嫩叶的浅绿色。
    static var omChinese嫩绿: UIColor { return UIColor(omHex: 0xBDDD22) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 柳黄：像柳树芽那样的浅黄色。
    static var omChinese柳黄: UIColor { return UIColor(omHex: 0xC9DD22) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 柳绿：柳叶的青绿色。
    static var omChinese柳绿: UIColor { return UIColor(omHex: 0xAFDD22) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 竹青：竹子的绿色。
    static var omChinese竹青: UIColor { return UIColor(omHex: 0x789262) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 葱黄：黄绿色，嫩黄色。
    static var omChinese葱黄: UIColor { return UIColor(omHex: 0xA3D900) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 葱绿：1，浅绿又略显微黄的颜色 2，草木青翠的样子。
    static var omChinese葱绿: UIColor { return UIColor(omHex: 0x9ED900) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 葱青：淡淡的青绿色。
    static var omChinese葱青: UIColor { return UIColor(omHex: 0x0EB83A) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青葱：翠绿色，形容植物浓绿。
    static var omChinese青葱: UIColor { return UIColor(omHex: 0x0AA344) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 油绿：光润而浓绿的颜色。
    static var omChinese油绿: UIColor { return UIColor(omHex: 0x00BC12) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绿沉：深绿。
    static var omChinese绿沉: UIColor { return UIColor(omHex: 0x0C8918) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 碧色：1，青绿色。 2，青白色，浅蓝色。
    static var omChinese碧色: UIColor { return UIColor(omHex: 0x1BD1A5) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 碧绿：鲜艳的青绿色。
    static var omChinese碧绿: UIColor { return UIColor(omHex: 0x2ADD9C) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青碧：鲜艳的青蓝色。
    static var omChinese青碧: UIColor { return UIColor(omHex: 0x48C0A3) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 翡翠色：1，翡翠鸟羽毛的青绿色。 2，翡翠宝石的颜色。 (注：C-Y≧30 的系列色彩，多与白色配合以体现清新明丽感觉，与黑色配合效果不好：该色个性柔弱，会被黑色牵制)
    static var omChinese翡翠色: UIColor { return UIColor(omHex: 0x3DE1AD) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 草绿：绿而略黄的颜色。
    static var omChinese草绿: UIColor { return UIColor(omHex: 0x40DE5A) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青色：1，一类带绿的蓝色，中等深浅，高度饱和。 3，本义是蓝色。 4，一般指深绿色。 5，也指黑色。 6，四色印刷中的一色。 2，特指三补色中的一色。
    static var omChinese青色: UIColor { return UIColor(omHex: 0x00E09E) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青翠：鲜绿。
    static var omChinese青翠: UIColor { return UIColor(omHex: 0x00E079) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青白：白而发青,尤指脸没有血色。
    static var omChinese青白: UIColor { return UIColor(omHex: 0xC0EBD7) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 鸭卵青：淡青灰色，极淡的青绿色。
    static var omChinese鸭卵青: UIColor { return UIColor(omHex: 0xE0EEE8) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 蟹壳青：深灰绿色。
    static var omChinese蟹壳青: UIColor { return UIColor(omHex: 0xBBCDC5) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 鸦青：鸦羽的颜色。即黑而带有紫绿光的颜色。
    static var omChinese鸦青: UIColor { return UIColor(omHex: 0x424C50) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绿色：1，在光谱中介于蓝与黄之间的那种颜色。 2，本义：青中带黄的颜色。 3，引申为黑色，如绿鬓：乌黑而光亮的鬓发。代指为青春年少的容颜。
    static var omChinese绿色: UIColor { return UIColor(omHex: 0x00E500) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 豆绿：浅黄绿色。
    static var omChinese豆绿: UIColor { return UIColor(omHex: 0x9ED048) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 豆青：浅青绿色。
    static var omChinese豆青: UIColor { return UIColor(omHex: 0x96CE54) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 石青：淡灰绿色。
    static var omChinese石青: UIColor { return UIColor(omHex: 0x7BCFA6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 玉色：玉的颜色，高雅的淡绿、淡青色
    static var omChinese玉色: UIColor { return UIColor(omHex: 0x7BCFA6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 缥：绿色而微白。
    static var omChinese缥: UIColor { return UIColor(omHex: 0x7FECAD) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 艾绿：艾草的颜色，偏苍白的绿色。
    static var omChinese艾绿: UIColor { return UIColor(omHex: 0xA4E2C6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 松柏绿：经冬松柏叶的深绿。
    static var omChinese松柏绿: UIColor { return UIColor(omHex: 0x21A675) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 松花绿：亦作“松花”、“松绿”。偏黑的深绿色,墨绿。
    static var omChinese松花绿: UIColor { return UIColor(omHex: 0x057748) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 松花色：浅黄绿色。（松树花粉的颜色）《红楼梦》中提及松花配桃红为娇艳
    static var omChinese松花色: UIColor { return UIColor(omHex: 0xBCE672) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 蓝：三原色的一种。像晴天天空的颜色（注：这里的蓝色指的不是RGB色彩中的B，而是CMY色彩中的C）
    static var omChinese蓝: UIColor { return UIColor(omHex: 0x44CEF6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 靛青：也叫“蓝靛”。用蓼蓝叶泡水调和与石灰沉淀所得的蓝色染料。呈深蓝绿色 （注：有些地方将蓝墨水称为“靛水”或者“兰靛水”）
    static var omChinese靛青: UIColor { return UIColor(omHex: 0x177CB0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 靛蓝：由植物(例如靛蓝或菘蓝属植物)得到的蓝色染料。
    static var omChinese靛蓝: UIColor { return UIColor(omHex: 0x065279) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 碧蓝：青蓝色。
    static var omChinese碧蓝: UIColor { return UIColor(omHex: 0x3EEDE7) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 蔚蓝：类似晴朗天空的颜色的一种蓝色。
    static var omChinese蔚蓝: UIColor { return UIColor(omHex: 0x70F3FF) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 宝蓝：鲜艳明亮的蓝色（注：英文中为RoyalBlue 即皇家蓝色，是皇室选用的色彩，多和小面积纯黄色（金色）配合使用。）
    static var omChinese宝蓝: UIColor { return UIColor(omHex: 0x4B5CC4) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 蓝灰色：一种近于灰略带蓝的深灰色。
    static var omChinese蓝灰色: UIColor { return UIColor(omHex: 0xA1AFC9) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 藏青：蓝而近黑。
    static var omChinese藏青: UIColor { return UIColor(omHex: 0x2E4E7E) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 藏蓝：蓝里略透红色。
    static var omChinese藏蓝: UIColor { return UIColor(omHex: 0x3B2E7E) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黛：青黑色的颜料。古代女子用以画眉。
    static var omChinese黛: UIColor { return UIColor(omHex: 0x4A4266) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黛绿：墨绿。
    static var omChinese黛绿: UIColor { return UIColor(omHex: 0x426666) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黛蓝：深蓝色。
    static var omChinese黛蓝: UIColor { return UIColor(omHex: 0x425066) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黛紫：深紫色
    static var omChinese黛紫: UIColor { return UIColor(omHex: 0x574266) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 紫色：蓝和红组成的颜色。古人以紫为祥瑞的颜色。代指与帝王、皇宫有关的事物。
    static var omChinese紫色: UIColor { return UIColor(omHex: 0x8D4BBB) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 紫酱：浑浊的紫色。
    static var omChinese紫酱: UIColor { return UIColor(omHex: 0x815463) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 酱紫：紫中略带红的颜色。
    static var omChinese酱紫: UIColor { return UIColor(omHex: 0x815476) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 紫檀：檀木的颜色，也称乌檀色乌木色。
    static var omChinese紫檀: UIColor { return UIColor(omHex: 0x4C221B) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 绀青绀紫：纯度较低的深紫色。
    static var omChinese绀青: UIColor { return UIColor(omHex: 0x003371) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 紫棠：黑红色。
    static var omChinese紫棠: UIColor { return UIColor(omHex: 0x56004F) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 青莲：偏蓝的紫色。
    static var omChinese青莲: UIColor { return UIColor(omHex: 0x801DAE) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 群青：深蓝色。
    static var omChinese群青: UIColor { return UIColor(omHex: 0x4C8DAE) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 雪青：浅蓝紫色。
    static var omChinese雪青: UIColor { return UIColor(omHex: 0xB0A4E3) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 丁香色：紫丁香的颜色，浅浅的紫色，很娇柔淡雅的色彩。
    static var omChinese丁香色: UIColor { return UIColor(omHex: 0xCCA4E3) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 藕色：浅灰而略带红的颜色。
    static var omChinese藕色: UIColor { return UIColor(omHex: 0xEDD1D8) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 苍色：即各种颜色掺入黑色后的颜色，如苍翠。
    static var omChinese苍色: UIColor { return UIColor(omHex: 0x75878A) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 苍黄
    static var omChinese苍黄: UIColor { return UIColor(omHex: 0x519A73) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 苍青
    static var omChinese苍青: UIColor { return UIColor(omHex: 0xA29B7C) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 苍黑
    static var omChinese苍黑: UIColor { return UIColor(omHex: 0x7397AB) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 苍白
    static var omChinese苍白: UIColor { return UIColor(omHex: 0xD1D9E0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 水色
    static var omChinese水色: UIColor { return UIColor(omHex: 0x88ADA6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 水红
    static var omChinese水红: UIColor { return UIColor(omHex: 0xF3D3E7) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 水绿
    static var omChinese水绿: UIColor { return UIColor(omHex: 0xD4F2E7) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 水蓝
    static var omChinese水蓝: UIColor { return UIColor(omHex: 0xD2F0F4) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 淡青
    static var omChinese淡青: UIColor { return UIColor(omHex: 0xD3E0F3) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 湖蓝
    static var omChinese湖蓝: UIColor { return UIColor(omHex: 0x30DFF3) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 湖绿
    static var omChinese湖绿: UIColor { return UIColor(omHex: 0x25F8CB) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 精白
    static var omChinese精白: UIColor { return UIColor(omHex: 0xFFFFFF) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 像牙白：乳白色。
    static var omChinese像牙白: UIColor { return UIColor(omHex: 0xFFFBF0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 雪白：如雪般洁白。
    static var omChinese雪白: UIColor { return UIColor(omHex: 0xF0FCFF) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 月白：淡蓝色。
    static var omChinese月白: UIColor { return UIColor(omHex: 0xD6ECF0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 缟：白色。
    static var omChinese缟: UIColor { return UIColor(omHex: 0xF2ECDE) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 素：白色，无色。
    static var omChinese素: UIColor { return UIColor(omHex: 0xE0F0E9) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 荼白：如荼之白色。
    static var omChinese荼白: UIColor { return UIColor(omHex: 0xF3F9F1) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 霜色：白霜的颜色。
    static var omChinese霜色: UIColor { return UIColor(omHex: 0xE9F1F6) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 花白：白色和黑色混杂的。斑白的 夹杂有灰色的白。
    static var omChinese花白: UIColor { return UIColor(omHex: 0xC2CCD0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 鱼肚白：似鱼腹部的颜色，多指黎明时东方的天色颜色。
    static var omChinese鱼肚白: UIColor { return UIColor(omHex: 0xFCEFE8) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 莹白：晶莹洁白。
    static var omChinese莹白: UIColor { return UIColor(omHex: 0xE3F9FD) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 灰色：黑色和白色混和成的一种颜色。
    static var omChinese灰色: UIColor { return UIColor(omHex: 0x808080) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 牙色：与像牙相似的淡黄色。（注：暖白）
    static var omChinese牙色: UIColor { return UIColor(omHex: 0xEEDEB0) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 铅白：铅粉的白色。铅粉，国画颜料，日久易氧化“返铅”变黑。铅粉在古时用以搽脸的化妆品。（注：冷白）
    static var omChinese铅白: UIColor { return UIColor(omHex: 0xF0F0F4) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 玄色：赤黑色，黑中带红的颜色，又泛指黑色。
    static var omChinese玄色: UIColor { return UIColor(omHex: 0x622A1D) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 玄青：深黑色。
    static var omChinese玄青: UIColor { return UIColor(omHex: 0x3D3B4F) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 乌色：暗而呈黑的颜色。
    static var omChinese乌色: UIColor { return UIColor(omHex: 0x725E82) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 乌黑：深黑。
    static var omChinese乌黑: UIColor { return UIColor(omHex: 0x392F41) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 漆黑：非常黑的。
    static var omChinese漆黑: UIColor { return UIColor(omHex: 0x161823) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 墨色：即黑色。
    static var omChinese墨色: UIColor { return UIColor(omHex: 0x50616D) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 墨灰：即黑灰。
    static var omChinese墨灰: UIColor { return UIColor(omHex: 0x758A99) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黑色：亮度最低的非彩色的或消色差的物体的颜色；最暗的灰色；被认为特别属于那些既不能反射、又不能透过能使人感觉到的微小入射光的物体,任何亮度很低的物体颜色。
    static var omChinese黑色: UIColor { return UIColor(omHex: 0x000000) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 缁色：帛黑色。
    static var omChinese缁色: UIColor { return UIColor(omHex: 0x493131) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 煤黑像牙黑：都是黑，不过有冷暖之分。
    static var omChinese煤黑: UIColor { return UIColor(omHex: 0x312520) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黧：黑中带黄的颜色。
    static var omChinese黧: UIColor { return UIColor(omHex: 0x5D513C) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黎：黑中带黄似黎草色。
    static var omChinese黎: UIColor { return UIColor(omHex: 0x75664D) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黝：本义为淡黑色或微青黑色。
    static var omChinese黝: UIColor { return UIColor(omHex: 0x6B6882) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黝黑：（皮肤暴露在太阳光下而晒成的）青黑色。
    static var omChinese黝黑: UIColor { return UIColor(omHex: 0x665757) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 黯：深黑色、泛指黑色。
    static var omChinese黯: UIColor { return UIColor(omHex: 0x41555D) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 赤金：足金的颜色。
    static var omChinese赤金: UIColor { return UIColor(omHex: 0xF2BE45) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 金色：平均为深黄色带光泽的颜色。
    static var omChinese金色: UIColor { return UIColor(omHex: 0xEACD76) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 银白：带银光的白色。
    static var omChinese银白: UIColor { return UIColor(omHex: 0xE9E7EF) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 铜绿
    static var omChinese铜绿: UIColor { return UIColor(omHex: 0x549688) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 乌金
    static var omChinese乌金: UIColor { return UIColor(omHex: 0xA78E44) }
    
    @available(*, deprecated, message: "Extensions directly deprecated. Use `UIColor.OM.*` instead.")
    /// 老银：金属氧化后的色彩。
    static var omChinese老银: UIColor { return UIColor(omHex: 0xBACAC6) }
    
}
