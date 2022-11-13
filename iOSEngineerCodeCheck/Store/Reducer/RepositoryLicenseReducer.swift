//
//  RepositoryLicenseReducer.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/11/14.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func repositoryLicenseReducer(_ state: RepositoryLicenseState, action: ActionProtocol) -> RepositoryLicenseState {
    var state = state

    switch action {
    case let action as SetRepositoryLicense:
        state.license = action.license
    default:
        break
    }

    return state
}
