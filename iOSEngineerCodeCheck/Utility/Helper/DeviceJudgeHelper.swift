//
//  DeviceJudgeHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/1.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class DeviceJudgeHelper {
    static var getType: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
}
