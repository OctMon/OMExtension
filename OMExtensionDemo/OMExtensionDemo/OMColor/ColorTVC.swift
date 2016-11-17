//
//  ColorTVC.swift
//  OMExtensionDemo
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

import UIKit

class ColorTVC: BaseTVC {
    
    var colors: [(UIColor, String, String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.OM.粉红
        tableView.rowHeight = 128
        
        
        colors = [
            (UIColor.OM.粉红, "粉红", "即浅红色。别称：妃色杨妃色湘妃色妃红色。")
            , (UIColor.OM.妃色, "妃色", "妃红色：古同“绯”，粉红色。杨妃色 湘妃色 粉红皆同义。")
            , (UIColor.OM.品红, "品红", "品红：比大红浅的红色。")
            , (UIColor.OM.桃红, "桃红", "桃红，桃花的颜色，比粉红略鲜润的颜色。")
            , (UIColor.OM.海棠红, "海棠红", "海棠红，淡紫红色、较桃红色深一些，是非常妩媚娇艳的颜色。")
            , (UIColor.OM.石榴红, "石榴红", "石榴红：石榴花的颜色，高色度和纯度的红色。")
            , (UIColor.OM.樱桃色, "樱桃色", "樱桃色：鲜红色。")
            , (UIColor.OM.银红, "银红", "银红：银朱和粉红色颜料配成的颜色。多用来形容有光泽的各种红色，尤指有光泽浅红。")
            , (UIColor.OM.大红, "大红", "大红：正红色，三原色中的红，传统的中国红，又称绛色。")
            , (UIColor.OM.绛紫, "绛紫", "绛紫：紫中略带红的颜色。")
            , (UIColor.OM.绯红, "绯红", "绯红：艳丽的深红。")
            , (UIColor.OM.胭脂, "胭脂", "胭脂：1，女子装扮时用的胭脂的颜色。 2，国画暗红色颜料。")
            , (UIColor.OM.朱红, "朱红", "朱红：朱砂的颜色，比大红活泼，也称铅朱朱色丹色。")
            , (UIColor.OM.丹, "丹", "丹：丹砂的鲜艳红色")
            , (UIColor.OM.彤, "彤", "彤：赤色。")
            , (UIColor.OM.茜色, "茜色", "茜色：茜草染的色彩，呈深红色。")
            , (UIColor.OM.火红, "火红", "火红：火焰的红色，赤色。")
            , (UIColor.OM.赫赤, "赫赤", "赫赤：深红，火红。泛指赤色、火红色。")
            , (UIColor.OM.嫣红, "嫣红", "嫣红：鲜艳的红色。")
            , (UIColor.OM.洋红, "洋红", "洋红：色橘红。")
            , (UIColor.OM.炎, "炎", "炎：引申为红色。")
            , (UIColor.OM.赤, "赤", "赤：本义火的颜色，即红色。")
            , (UIColor.OM.绾, "绾", "绾：绛色；浅绛色。")
            , (UIColor.OM.枣红, "枣红", "枣红：即深红。")
            , (UIColor.OM.檀, "檀", "檀：浅红色，浅绛色。")
            , (UIColor.OM.殷红, "殷红", "殷红：发黑的红色。")
            , (UIColor.OM.酡红, "酡红", "酡红：像饮酒后脸上泛现的红色，泛指脸红。")
            , (UIColor.OM.酡颜, "酡颜", "酡颜：饮酒脸红的样子，亦泛指脸红色。")
            , (UIColor.OM.鹅黄, "鹅黄", "鹅黄：淡黄色。")
            , (UIColor.OM.鸭黄, "鸭黄", "鸭黄：小鸭毛的黄色。")
            , (UIColor.OM.樱草色, "樱草色", "樱草色：淡黄色。")
            , (UIColor.OM.杏黄, "杏黄", "杏黄：成熟杏子的黄色。")
            , (UIColor.OM.杏红, "杏红", "杏红：成熟杏子偏红色的一种颜色。")
            , (UIColor.OM.橘黄, "橘黄", "橘黄：柑橘的黄色。")
            , (UIColor.OM.橙黄, "橙黄", "橙黄：橙的黄色。（现代感比较强，广告上用得较多）")
            , (UIColor.OM.橘红, "橘红", "橘红：柑橘皮所呈现的红色。")
            , (UIColor.OM.姜黄, "姜黄", "姜黄：中药名，别名黄姜，为姜科植物姜黄的根茎。又指人脸色不正，呈黄白色。")
            , (UIColor.OM.缃色, "缃色", "缃色：浅黄色。")
            , (UIColor.OM.橙色, "橙色", "橙色：界于红色和黄色之间的混合色。")
            , (UIColor.OM.茶色, "茶色", "茶色：一种比栗色稍红的棕橙色至浅棕色。")
            , (UIColor.OM.驼色, "驼色", "驼色：一种比哢叽色稍红而微淡、比肉桂色黄而稍淡和比核桃棕色黄而暗的浅黄棕色。")
            , (UIColor.OM.昏黄, "昏黄", "昏黄：形容天色、灯光等呈幽暗的黄色。")
            , (UIColor.OM.栗色, "栗色", "栗色：栗壳的颜色，即紫黑色。")
            , (UIColor.OM.棕色, "棕色", "棕色：棕毛的颜色,即褐色。 1，在红色和黄色之间的任何一种颜色 2，适中的暗淡和适度的浅黑。")
            , (UIColor.OM.棕绿, "棕绿", "棕绿：绿中泛棕色的一种颜色。")
            , (UIColor.OM.棕黑, "棕黑", "棕黑：深​​棕色。")
            , (UIColor.OM.棕红, "棕红", "棕红：红褐色。")
            , (UIColor.OM.棕黄, "棕黄", "棕黄：浅褐色。")
            , (UIColor.OM.赭色, "赭色", "赭色：红色、赤红色。古人用以饰面。")
            , (UIColor.OM.枯黄, "枯黄", "枯黄：干枯焦黄。")
            , (UIColor.OM.黄栌, "黄栌", "黄栌：一种落叶灌木，花黄绿色，叶子秋天变成红色，木材黄色可做染料。")
            , (UIColor.OM.秋色, "秋色", "秋色：1，中常橄榄棕色，它比一般橄榄棕色稍暗，且稍稍绿些。 2，古以秋为金，其色白，故代指白色。")
            , (UIColor.OM.秋香色, "秋香色", "秋香色：浅橄榄色浅黄绿色。（注：直接在Y中掺入k10~30可得到不同浓淡的该类色彩）")
            , (UIColor.OM.嫩绿, "嫩绿", "嫩绿：像刚长出的嫩叶的浅绿色。")
            , (UIColor.OM.柳黄, "柳黄", "柳黄：像柳树芽那样的浅黄色。")
            , (UIColor.OM.柳绿, "柳绿", "柳绿：柳叶的青绿色。")
            , (UIColor.OM.竹青, "竹青", "竹青：竹子的绿色。")
            , (UIColor.OM.葱黄, "葱黄", "葱黄：黄绿色，嫩黄色。")
            , (UIColor.OM.葱绿, "葱绿", "葱绿：1，浅绿又略显微黄的颜色 2，草木青翠的样子。")
            , (UIColor.OM.葱青, "葱青", "葱青：淡淡的青绿色。")
            , (UIColor.OM.青葱, "青葱", "青葱：翠绿色，形容植物浓绿。")
            , (UIColor.OM.油绿, "油绿", "油绿：光润而浓绿的颜色。")
            , (UIColor.OM.绿沉, "绿沉", "绿沉：深绿。")
            , (UIColor.OM.碧色, "碧色", "碧色：1，青绿色。 2，青白色，浅蓝色。")
            , (UIColor.OM.碧绿, "碧绿", "碧绿：鲜艳的青绿色。")
            , (UIColor.OM.青碧, "青碧", "青碧：鲜艳的青蓝色。")
            , (UIColor.OM.翡翠色, "翡翠色", "翡翠色：1，翡翠鸟羽毛的青绿色。 2，翡翠宝石的颜色。 (注：C-Y≧30 的系列色彩，多与白色配合以体现清新明丽感觉，与黑色配合效果不好：该色个性柔弱，会被黑色牵制)")
            , (UIColor.OM.草绿, "草绿", "草绿：绿而略黄的颜色。")
            , (UIColor.OM.青色, "青色", "青色：1，一类带绿的蓝色，中等深浅，高度饱和。 3，本义是蓝色。 4，一般指深绿色。 5，也指黑色。 6，四色印刷中的一色。 2，特指三补色中的一色。")
            , (UIColor.OM.青翠, "青翠", "青翠：鲜绿。")
            , (UIColor.OM.青白, "青白", "白而发青,尤指脸没有血色。")
            , (UIColor.OM.鸭卵青, "鸭卵青", "")
            , (UIColor.OM.蟹壳青, "蟹壳青", "蟹壳青：深灰绿色。")
            , (UIColor.OM.鸦青, "鸦青", "鸦青：鸦羽的颜色。即黑而带有紫绿光的颜色。")
            , (UIColor.OM.绿色, "绿色", "绿色：1，在光谱中介于蓝与黄之间的那种颜色。 2，本义：青中带黄的颜色。 3，引申为黑色，如绿鬓：乌黑而光亮的鬓发。代指为青春年少的容颜。")
            , (UIColor.OM.豆绿, "豆绿", "豆绿：浅黄绿色。")
            , (UIColor.OM.豆青, "豆青", "豆青：浅青绿色。")
            , (UIColor.OM.石青, "石青", "石青：淡灰绿色。")
            , (UIColor.OM.玉色, "玉色", "玉色：玉的颜色，高雅的淡绿、淡青色")
            , (UIColor.OM.缥, "缥", "缥：绿色而微白。")
            , (UIColor.OM.艾绿, "艾绿", "艾绿：艾草的颜色，偏苍白的绿色。")
            , (UIColor.OM.松柏绿, "松柏绿", "松柏绿：经冬松柏叶的深绿。")
            , (UIColor.OM.松花绿, "松花绿", "松花绿：亦作“松花”、“松绿”。偏黑的深绿色,墨绿。")
            , (UIColor.OM.松花色, "松花色", "松花色：浅黄绿色。（松树花粉的颜色）《红楼梦》中提及松花配桃红为娇艳")
            , (UIColor.OM.蓝, "蓝", "蓝：三原色的一种。像晴天天空的颜色（注：这里的蓝色指的不是RGB色彩中的B，而是CMY色彩中的C）")
            , (UIColor.OM.靛青, "靛青", "靛青：也叫“蓝靛”。用蓼蓝叶泡水调和与石灰沉淀所得的蓝色染料。呈深蓝绿色 （注：有些地方将蓝墨水称为“靛水”或者“兰靛水”）")
            , (UIColor.OM.靛蓝, "靛蓝", "靛蓝：由植物(例如靛蓝或菘蓝属植物)得到的蓝色染料。")
            , (UIColor.OM.碧蓝, "碧蓝", "碧蓝：青蓝色。")
            , (UIColor.OM.蔚蓝, "蔚蓝", "蔚蓝：类似晴朗天空的颜色的一种蓝色。")
            , (UIColor.OM.宝蓝, "宝蓝", "宝蓝：鲜艳明亮的蓝色（注：英文中为RoyalBlue 即皇家蓝色，是皇室选用的色彩，多和小面积纯黄色（金色）配合使用。）")
            , (UIColor.OM.蓝灰色, "蓝灰色", "蓝灰色：一种近于灰略带蓝的深灰色。")
            , (UIColor.OM.藏青, "藏青", "藏青：蓝而近黑。")
            , (UIColor.OM.藏蓝, "藏蓝", "藏蓝：蓝里略透红色。")
            , (UIColor.OM.黛, "黛", "黛：青黑色的颜料。古代女子用以画眉。")
            , (UIColor.OM.黛绿, "黛绿", "黛绿：墨绿。")
            , (UIColor.OM.黛蓝, "黛蓝", "黛蓝：深蓝色。")
            , (UIColor.OM.黛紫, "黛紫", "黛紫：深紫色")
            , (UIColor.OM.紫色, "紫色", "紫色：蓝和红组成的颜色。古人以紫为祥瑞的颜色。代指与帝王、皇宫有关的事物。")
            , (UIColor.OM.紫酱, "紫酱", "紫酱：浑浊的紫色。")
            , (UIColor.OM.酱紫, "酱紫", "酱紫：紫中略带红的颜色。")
            , (UIColor.OM.紫檀, "紫檀", "紫檀：檀木的颜色，也称乌檀色乌木色。")
            , (UIColor.OM.绀青, "绀青", "绀青绀紫：纯度较低的深紫色。")
            , (UIColor.OM.紫棠, "紫棠", "紫棠：黑红色。")
            , (UIColor.OM.青莲, "青莲", "青莲：偏蓝的紫色。")
            , (UIColor.OM.群青, "群青", "群青：深蓝色。")
            , (UIColor.OM.雪青, "雪青", "雪青：浅蓝紫色。")
            , (UIColor.OM.丁香色, "丁香色", "丁香色：紫丁香的颜色，浅浅的紫色，很娇柔淡雅的色彩。")
            , (UIColor.OM.藕色, "藕色", "藕色：浅灰而略带红的颜色。")
            , (UIColor.OM.苍色, "苍色", "苍色：即各种颜色掺入黑色后的颜色，如苍翠。")
            , (UIColor.OM.苍黄, "苍黄", "")
            , (UIColor.OM.苍青, "苍青", "")
            , (UIColor.OM.苍黑, "苍黑", "")
            , (UIColor.OM.苍白, "苍白", "")
            , (UIColor.OM.水色, "水色", "")
            , (UIColor.OM.水红, "水红", "")
            , (UIColor.OM.水绿, "水绿", "")
            , (UIColor.OM.水蓝, "水蓝", "")
            , (UIColor.OM.淡青, "淡青", "")
            , (UIColor.OM.湖蓝, "湖蓝", "")
            , (UIColor.OM.湖绿, "湖绿", "")
            , (UIColor.OM.精白, "精白", "")
            , (UIColor.OM.像牙白, "像牙白", "像牙白：乳白色。")
            , (UIColor.OM.雪白, "雪白", "雪白：如雪般洁白。")
            , (UIColor.OM.月白, "月白", "月白：淡蓝色。")
            , (UIColor.OM.缟, "缟", "缟：白色。")
            , (UIColor.OM.素, "素", "素：白色，无色。")
            , (UIColor.OM.荼白, "荼白", "荼白：如荼之白色。")
            , (UIColor.OM.霜色, "霜色", "霜色：白霜的颜色。")
            , (UIColor.OM.花白, "花白", "花白：白色和黑色混杂的。斑白的 夹杂有灰色的白。")
            , (UIColor.OM.鱼肚白, "鱼肚白", "鱼肚白：似鱼腹部的颜色，多指黎明时东方的天色颜色。")
            , (UIColor.OM.莹白, "莹白", "莹白：晶莹洁白。")
            , (UIColor.OM.灰色, "灰色", "灰色：黑色和白色混和成的一种颜色。")
            , (UIColor.OM.牙色, "牙色", "牙色：与像牙相似的淡黄色。（注：暖白）")
            , (UIColor.OM.铅白, "铅白", "铅白：铅粉的白色。铅粉，国画颜料，日久易氧化“返铅”变黑。铅粉在古时用以搽脸的化妆品。（注：冷白）")
            , (UIColor.OM.玄色, "玄色", "玄色：赤黑色，黑中带红的颜色，又泛指黑色。")
            , (UIColor.OM.玄青, "玄青", "玄青：深黑色。")
            , (UIColor.OM.乌色, "乌色", "乌色：暗而呈黑的颜色。")
            , (UIColor.OM.乌黑, "乌黑", "乌黑：深黑。")
            , (UIColor.OM.漆黑, "漆黑", "漆黑：非常黑的。")
            , (UIColor.OM.墨色, "墨色", "墨色：即黑色。")
            , (UIColor.OM.墨灰, "墨灰", "墨灰：即黑灰")
            , (UIColor.OM.黑色, "黑色", "黑色：亮度最低的非彩色的或消色差的物体的颜色；最暗的灰色；被认为特别属于那些既不能反射、又不能透过能使人感觉到的微小入射光的物体,任何亮度很低的物体颜色。")
            , (UIColor.OM.缁色, "缁色", "帛黑色。")
            , (UIColor.OM.煤黑, "煤黑", "煤黑像牙黑：都是黑，不过有冷暖之分。")
            , (UIColor.OM.黧, "黧", "黑中带黄的颜色。")
            , (UIColor.OM.黎, "黎", "黎：黑中带黄似黎草色。")
            , (UIColor.OM.黝, "黝", "黝：本义为淡黑色或微青黑色。")
            , (UIColor.OM.黯, "黯", "黯：深黑色、泛指黑色。")
            , (UIColor.OM.赤金, "赤金", "赤金：足金的颜色。")
            , (UIColor.OM.金色, "金色", "金色：平均为深黄色带光泽的颜色。")
            , (UIColor.OM.银白, "银白", "银白：带银光的白色。")
            , (UIColor.OM.铜绿, "铜绿", "")
            , (UIColor.OM.乌金, "乌金", "")
            , (UIColor.OM.老银, "老银", "老银：金属氧化后的色彩。")
        ]
        
        /*colors.forEach { (color) in
            
            if color.2.characters.count > 0 {
                
                print("UIColor." + color.1 + " // " + color.2)
                
            } else {
                
                print("UIColor." + color.1)
            }
        }*/
        
        Thread.OM.runInMain(delay: 0.1, handler: {
            
            self.tableView.reloadData()
        })
    }

}

extension ColorTVC {
    
    // MARK: Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.omClassName, for: indexPath)
        
        cell.selectionStyle = .none
        
        cell.backgroundColor = colors[(indexPath as NSIndexPath).row].0
        cell.textLabel?.text = colors[(indexPath as NSIndexPath).row].1.replacingOccurrences(of: "omChinese", with: "") + " RGB(" + cell.backgroundColor!.om.red.omToString + "," + cell.backgroundColor!.om.green.omToString + "," + cell.backgroundColor!.om.blue.omToString + ")"
        cell.detailTextLabel?.text = colors[(indexPath as NSIndexPath).row].2
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.textLabel?.textColor = cell.backgroundColor!.om.isLight ? UIColor.black : UIColor.white
        cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        
        return cell
    }

}
