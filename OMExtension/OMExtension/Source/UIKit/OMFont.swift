//
//  OMFont.swift
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

public enum OMFamilyFontName : String {
    case academyEngravedLET = "Academy Engraved LET"
    case alNile = "Al Nile"
    case americanTypewriter = "American Typewriter"
    case appleColorEmoji = "Apple Color Emoji"
    case appleSDGothicNeo = "Apple SD Gothic Neo"
    case arial = "Arial"
    case arialHebrew = "Arial Hebrew"
    case arialRoundedMTBold = "Arial Rounded MT Bold"
    case avenir = "Avenir"
    case avenirNext = "Avenir Next"
    case avenirNextCondensed = "Avenir Next Condensed"
    case banglaSangamMN = "Bangla Sangam MN" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case baskerville = "Baskerville"
    case bodoni72 = "Bodoni 72"
    case bodoni72Oldstyle = "Bodoni 72 Oldstyle"
    case bodoni72Smallcaps = "Bodoni 72 Smallcaps"
    case bodoniOrnaments = "Bodoni Ornaments"
    case bradleyHand = "Bradley Hand"
    case chalkboardSE = "Chalkboard SE"
    case chalkduster = "Chalkduster"
    case cochin = "Cochin"
    case copperplate = "Copperplate"
    case courier = "Courier"
    case courierNew = "Courier New"
    case damascus = "Damascus"
    case devanagariSangamMN = "Devanagari Sangam MN"
    case didot = "Didot"
    case dINAlternate = "DIN Alternate" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case dINCondensed = "DIN Condensed" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case euphemiaUCAS = "Euphemia UCAS"
    case farah = "Farah"
    case futura = "Futura"
    case geezaPro = "Geeza Pro"
    case georgia = "Georgia"
    case gillSans = "Gill Sans"
    case gujaratiSangamMN = "Gujarati Sangam MN"
    case gurmukhiMN = "Gurmukhi MN"
    case heitiSC = "Heiti SC"
    case heitiTC = "Heiti TC"
    case helvetica = "Helvetica"
    case helveticaNeue = "Helvetica Neue"
    case hiraginoKakuGothicProN = "Hiragino Kaku Gothic ProN"
    case hiraginoMinchoProN = "Hiragino Mincho ProN"
    case hoeflerText = "Hoefler Text"
    case iowanOldStyle = "Iowan Old Style" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case kailasa = "Kailasa"
    case kannadaSangamMN = "Kannada Sangam MN"
    case khmerSangamMN = "Khmer Sangam MN" /*@available(*, introduced=8.0)*/
    case kohinoorBangla = "Kohinoor Bangla" /*@available(*, introduced=8.0)*/
    case kohinoorDevanagari = "Kohinoor Devanagari" /*@available(*, introduced=8.0)*/
    case laoSangamMN = "Lao Sangam MN" /*@available(*, introduced=8.0)*/
    case malayalamSangamMN = "Malayalam Sangam MN"
    case marion = "Marion" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case markerFelt = "Marker Felt"
    case menlo = "Menlo"
    case mishafi = "Mishafi"
    case noteworthy = "Noteworthy"
    case optima = "Optima"
    case oriyaSangamMN = "Oriya Sangam MN"
    case palatino = "Palatino"
    case papyrus = "Papyrus"
    case partyLET = "Party LET"
    case savoyeLET = "Savoye LET"
    case sinhalaSangamMN = "Sinhala Sangam MN"
    case snellRoundhand = "Snell Roundhand"
    case superclarendon = "Superclarendon" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case symbol = "Symbol"
    case tamilSangamMN = "Tamil Sangam MN"
    case teluguSangamMN = "Telugu Sangam MN"
    case thonburi = "Thonburi"
    case timesNewRoman = "Times New Roman"
    case trebuchetMS = "Trebuchet MS"
    case verdana = "Verdana"
    case zapfDingbats = "Zapf Dingbats"
    case zapfino = "Zapfino"
}

public enum OMFontName : String {
    case academyEngravedLetPlain = "AcademyEngravedLetPlain"
    case alNile = "AlNile"
    case alNileBold = "AlNile-Bold"
    case americanTypewriter = "AmericanTypewriter"
    case americanTypewriterBold = "AmericanTypewriter-Bold"
    case americanTypewriterCondensed = "AmericanTypewriter-Condensed"
    case americanTypewriterCondensedBold = "AmericanTypewriter-CondensedBold"
    case americanTypewriterCondensedLight = "AmericanTypewriter-CondensedLight"
    case americanTypewriterLight = "AmericanTypewriter-Light"
    case appleColorEmoji = "AppleColorEmoji"
    case appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    case appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    case appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    case appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    case appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    case appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    case appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight" /*@available(*, introduced=9.0)*/
    case arialBoldItalicMT = "Arial-BoldItalicMT"
    case arialBoldMT = "Arial-BoldMT"
    case arialHebrew = "ArialHebrew"
    case arialHebrewBold = "ArialHebrew-Bold"
    case arialHebrewLight = "ArialHebrew-Light"
    case arialItalicMT = "Arial-ItalicMT"
    case arialMT = "ArialMT"
    case arialRoundedMTBold = "ArialRoundedMTBold"
    case aSTHeitiLight = "ASTHeiti-Light"
    case aSTHeitiMedium = "ASTHeiti-Medium"
    case avenirBlack = "Avenir-Black"
    case avenirBlackOblique = "Avenir-BlackOblique"
    case avenirBook = "Avenir-Book"
    case avenirBookOblique = "Avenir-BookOblique"
    case avenirHeavyOblique = "Avenir-HeavyOblique"
    case avenirHeavy = "Avenir-Heavy"
    case avenirLight = "Avenir-Light"
    case avenirLightOblique = "Avenir-LightOblique"
    case avenirMedium = "Avenir-Medium"
    case avenirMediumOblique = "Avenir-MediumOblique"
    case avenirNextBold = "AvenirNext-Bold"
    case avenirNextBoldItalic = "AvenirNext-BoldItalic"
    case avenirNextCondensedBold = "AvenirNextCondensed-Bold"
    case avenirNextCondensedBoldItalic = "AvenirNextCondensed-BoldItalic"
    case avenirNextCondensedDemiBold = "AvenirNextCondensed-DemiBold"
    case avenirNextCondensedDemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
    case avenirNextCondensedHeavy = "AvenirNextCondensed-Heavy"
    case avenirNextCondensedHeavyItalic = "AvenirNextCondensed-HeavyItalic"
    case avenirNextCondensedItalic = "AvenirNextCondensed-Italic"
    case avenirNextCondensedMedium = "AvenirNextCondensed-Medium"
    case avenirNextCondensedMediumItalic = "AvenirNextCondensed-MediumItalic"
    case avenirNextCondensedRegular = "AvenirNextCondensed-Regular"
    case avenirNextCondensedUltraLight = "AvenirNextCondensed-UltraLight"
    case avenirNextCondensedUltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
    case avenirNextDemiBold = "AvenirNext-DemiBold"
    case avenirNextDemiBoldItalic = "AvenirNext-DemiBoldItalic"
    case avenirNextHeavy = "AvenirNext-Heavy"
    case avenirNextItalic = "AvenirNext-Italic"
    case avenirNextMedium = "AvenirNext-Medium"
    case avenirNextMediumItalic = "AvenirNext-MediumItalic"
    case avenirNextRegular = "AvenirNext-Regular"
    case avenirNextUltraLight = "AvenirNext-UltraLight"
    case avenirNextUltraLightItalic = "AvenirNext-UltraLightItalic"
    case avenirOblique = "Avenir-Oblique"
    case avenirRoman = "Avenir-Roman"
    case banglaSangamMN = "BanglaSangamMN" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case banglaSangamMNBold = "BanglaSangamMN-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case baskerville = "Baskerville"
    case baskervilleBold = "Baskerville-Bold"
    case baskervilleBoldItalic = "Baskerville-BoldItalic"
    case baskervilleItalic = "Baskerville-Italic"
    case baskervilleSemiBold = "Baskerville-SemiBold"
    case baskervilleSemiBoldItalic = "Baskerville-SemiBoldItalic"
    case bodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    case bodoniSvtyTwoITCTTBold = "BodoniSvtyTwoITCTT-Bold"
    case bodoniSvtyTwoITCTTBook = "BodoniSvtyTwoITCTT-Book"
    case bodoniSvtyTwoITCTTBookIta = "BodoniSvtyTwoITCTT-BookIta"
    case bodoniSvtyTwoOSITCTTBold = "BodoniSvtyTwoOSITCTT-Bold"
    case bodoniSvtyTwoOSITCTTBook = "BodoniSvtyTwoOSITCTT-Book"
    case bodoniSvtyTwoOSITCTTBookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    case bodoniSvtyTwoSCITCTTBook = "BodoniSvtyTwoSCITCTT-Book"
    case bradleyHandITCTTBold = "BradleyHandITCTT-Bold"
    case chalkboardSEBold = "ChalkboardSE-Bold"
    case chalkboardSELight = "ChalkboardSE-Light"
    case chalkboardSERegular = "ChalkboardSE-Regular"
    case chalkduster = "Chalkduster"
    case cochin = "Cochin"
    case cochinBold = "Cochin-Bold"
    case cochinBoldItalic = "Cochin-BoldItalic"
    case cochinItalic = "Cochin-Italic"
    case copperplate = "Copperplate"
    case copperplateBold = "Copperplate-Bold"
    case copperplateLight = "Copperplate-Light"
    case courier = "Courier"
    case courierBold = "Courier-Bold"
    case courierBoldOblique = "Courier-BoldOblique"
    case courierNewPSBoldItalicMT = "CourierNewPS-BoldItalicMT"
    case courierNewPSBoldMT = "CourierNewPS-BoldMT"
    case courierNewPSItalicMT = "CourierNewPS-ItalicMT"
    case courierNewPSMT = "CourierNewPSMT"
    case courierOblique = "Courier-Oblique"
    case damascus = "Damascus"
    case damascusBold = "DamascusBold"
    case damascusMedium = "DamascusMedium"
    case damascusSemiBold = "DamascusSemiBold"
    case devanagariSangamMN = "DevanagariSangamMN"
    case devanagariSangamMNBold = "DevanagariSangamMN-Bold"
    case didot = "Didot"
    case didotBold = "Didot-Bold"
    case didotItalic = "Didot-Italic"
    case dINAlternateBold = "DINAlternate-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case dINCondensedBold = "DINCondensed-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case diwanMishafi = "DiwanMishafi"
    case euphemiaUCAS = "EuphemiaUCAS"
    case euphemiaUCASBold = "EuphemiaUCAS-Bold"
    case euphemiaUCASItalic = "EuphemiaUCAS-Italic"
    case farah = "Farah"
    case futuraCondensedExtraBold = "Futura-ExtraBold"
    case futuraCondensedMedium = "Futura-CondensedMedium"
    case futuraMedium = "Futura-Medium"
    case futuraMediumItalicm = "Futura-MediumItalic"
    case geezaPro = "GeezaPro"
    case geezaProBold = "GeezaPro-Bold"
    case geezaProLight = "GeezaPro-Light"
    case georgia = "Georgia"
    case georgiaBold = "Georgia-Bold"
    case georgiaBoldItalic = "Georgia-BoldItalic"
    case georgiaItalic = "Georgia-Italic"
    case gillSans = "GillSans"
    case gillSansBold = "GillSans-Bold"
    case gillSansBoldItalic = "GillSans-BoldItalic"
    case gillSansItalic = "GillSans-Italic"
    case gillSansLight = "GillSans-Light"
    case gillSansLightItalic = "GillSans-LightItalic"
    case gujaratiSangamMN = "GujaratiSangamMN"
    case gujaratiSangamMNBold = "GujaratiSangamMN-Bold"
    case gurmukhiMN = "GurmukhiMN"
    case gurmukhiMNBold = "GurmukhiMN-Bold"
    case helvetica = "Helvetica"
    case helveticaBold = "Helvetica-Bold"
    case helveticaBoldOblique = "Helvetica-BoldOblique"
    case helveticaLight = "Helvetica-Light"
    case helveticaLightOblique = "Helvetica-LightOblique"
    case helveticaNeue = "HelveticaNeue"
    case helveticaNeueBold = "HelveticaNeue-Bold"
    case helveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    case helveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    case helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    case helveticaNeueItalic = "HelveticaNeue-Italic"
    case helveticaNeueLight = "HelveticaNeue-Light"
    case helveticaNeueMedium = "HelveticaNeue-Medium"
    case helveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    case helveticaNeueThin = "HelveticaNeue-Thin"
    case helveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    case helveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    case helveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case helveticaOblique = "Helvetica-Oblique"
    case hiraKakuProNW3 = "HiraKakuProN-W3"
    case hiraKakuProNW6 = "HiraKakuProN-W6"
    case hiraMinProNW3 = "HiraMinProN-W3"
    case hiraMinProNW6 = "HiraMinProN-W6"
    case hoeflerTextBlack = "HoeflerText-Black"
    case hoeflerTextBlackItalic = "HoeflerText-BlackItalic"
    case hoeflerTextItalic = "HoeflerText-Italic"
    case hoeflerTextRegular = "HoeflerText-Regular"
    case iowanOldStyleBold = "IowanOldStyle-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case iowanOldStyleBoldItalic = "IowanOldStyle-BoldItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case iowanOldStyleItalic = "IowanOldStyle-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case iowanOldStyleRoman = "IowanOldStyle-Roman" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case kailasa = "Kailasa"
    case kailasaBold = "Kailasa-Bold"
    case kannadaSangamMN = "KannadaSangamMN"
    case kannadaSangamMNBold = "KannadaSangamMN-Bold"
    case khmerSangamMN = "KhmerSangamMN" /*@available(*, introduced=8.0)*/
    case kohinoorBanglaLight = "KohinoorBangla-Light" /*@available(*, introduced=9.0)*/
    case kohinoorBanglaMedium = "KohinoorBangla-Medium" /*@available(*, introduced=9.0)*/
    case kohinoorBanglaRegular = "KohinoorBangla-Regular" /*@available(*, introduced=9.0)*/
    case kohinoorDevanagariLight = "KohinoorDevanagari-Light" /*@available(*, introduced=8.0)*/
    case kohinoorDevanagariMedium = "KohinoorDevanagari-Medium" /*@available(*, introduced=8.0)*/
    case kohinoorDevanagariBook = "KohinoorDevanagari-Book" /*@available(*, introduced=8.0)*/
    case laoSangamMN = "LaoSangamMN" /*@available(*, introduced=8.0)*/
    case malayalamSangamMN = "MalayalamSangamMN"
    case malayalamSangamMNBold = "MalayalamSangamMN-Bold"
    case marionBold = "Marion-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case marionItalic = "Marion-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case marionRegular = "Marion-Regular" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case markerFeltThin = "MarkerFelt-Thin"
    case markerFeltWide = "MarkerFelt-Wide"
    case menloBold = "Menlo-Bold"
    case menloBoldItalic = "Menlo-BoldItalic"
    case menloItalic = "Menlo-Italic"
    case menloRegular = "Menlo-Regular"
    case noteworthyBold = "Noteworthy-Bold"
    case noteworthyLight = "Noteworthy-Light"
    case optimaBold = "Optima-Bold"
    case optimaBoldItalic = "Optima-BoldItalic"
    case optimaExtraBlack = "Optima-ExtraBold"
    case optimaItalic = "Optima-Italic"
    case optimaRegular = "Optima-Regular"
    case oriyaSangamMN = "OriyaSangamMN"
    case oriyaSangamMNBold = "OriyaSangamMN-Bold"
    case palatinoBold = "Palatino-Bold"
    case palatinoBoldItalic = "Palatino-BoldItalic"
    case palatinoItalic = "Palatino-Italic"
    case palatinoRoman = "Palatino-Roman"
    case papyrus = "Papyrus"
    case papyrusCondensed = "Papyrus-Condensed"
    case partyLetPlain = "PartyLetPlain"
    case savoyeLetPlain = "SavoyeLetPlain"
    case sinhalaSangamMN = "SinhalaSangamMN"
    case sinhalaSangamMNBold = "SinhalaSangamMN-Bold"
    case snellRoundhand = "SnellRoundhand"
    case snellRoundhandBlack = "SnellRoundhand-Black"
    case snellRoundhandBold = "SnellRoundhand-Bold"
    case sTHeitiSCLight = "STHeitiSC-Light"
    case sTHeitiSCMedium = "STHeitiSC-Medium"
    case sTHeitiTCLight = "STHeitiTC-Light"
    case sTHeitiTCMedium = "STHeitiTC-Medium"
    case superclarendonBlack = "Superclarendon-Black" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonBlackItalic = "Superclarendon-BalckItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonBold = "Superclarendon-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonBoldItalic = "Superclarendon-BoldItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonItalic = "Superclarendon-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonLight = "Superclarendon-Light" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonLightItalic = "Superclarendon-LightItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case superclarendonRegular = "Superclarendon-Regular" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case symbol = "Symbol"
    case tamilSangamMN = "TamilSangamMN"
    case tamilSangamMNBold = "TamilSangamMN-Bold"
    case teluguSangamMN = "TeluguSangamMN"
    case teluguSangamMNBold = "TeluguSangamMN-Bold"
    case thonburi = "Thonburi"
    case thonburiBold = "Thonburi-Bold"
    case thonburiLight = "Thonburi-Light"
    case timesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalic"
    case timesNewRomanPSBoldMT = "TimesNewRomanPS-Bold"
    case timesNewRomanPSItalicMT = "TimesNewRomanPS-ItalicMT"
    case timesNewRomanPSMT = "TimesNewRomanPSMT"
    case trebuchetBoldItalic = "Trebuchet-BoldItalic"
    case trebuchetMS = "TrebuchetMS"
    case trebuchetMSBold = "TrebuchetMS-Bold"
    case trebuchetMSItalic = "TrebuchetMS-Italic"
    case verdana = "Verdana"
    case verdanaBold = "Verdana-Bold"
    case verdanaBoldItalic = "Verdana-BoldItalic"
    case verdanaItalic = "Verdana-Italic"
}

public extension UIFont {
    
    convenience init?(omFontName: OMFontName, size: CGFloat) {
        self.init(name: omFontName.rawValue, size: size)
    }

}
