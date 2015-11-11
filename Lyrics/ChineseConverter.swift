//
//  ChineseConverter.swift
//  Lyrics
//
//  Created by Eru on 15/11/10.
//  Copyright © 2015年 Eru. All rights reserved.
//

import Cocoa

func convertToSC(input:NSString) ->NSString {
    let profilePath:NSString=NSBundle.mainBundle().pathForResource("t2s", ofType: "json")!
    return convertToChineseUsingProfile(profilePath,inputStr: input)
}

func convertToTC(input:NSString) ->NSString {
    let profilePath:NSString=NSBundle.mainBundle().pathForResource("s2t", ofType: "json")!
    return convertToChineseUsingProfile(profilePath,inputStr: input)
}

func convertToTC_Taiwan(input:NSString) ->NSString {
    let profilePath:NSString=NSBundle.mainBundle().pathForResource("s2tw", ofType: "json")!
    return convertToChineseUsingProfile(profilePath,inputStr: input)
}

func convertToTC_HK(input:NSString) ->NSString {
    let profilePath:NSString=NSBundle.mainBundle().pathForResource("s2hk", ofType: "json")!
    return convertToChineseUsingProfile(profilePath,inputStr: input)
}

func convertToChineseUsingProfile(profile:NSString, inputStr:NSString) ->NSString {
    let cc:opencc_t=opencc_open(profile.UTF8String)
    let cInput:UnsafePointer<Int8>=inputStr.UTF8String
    let cOutputStr:UnsafeMutablePointer<Int8>=opencc_convert_utf8(cc, cInput, Int(strlen(cInput)))
    let outputStr:NSString=NSString(UTF8String: cOutputStr)!
    opencc_convert_utf8_free(cOutputStr)
    opencc_close(cc)
    return outputStr
}