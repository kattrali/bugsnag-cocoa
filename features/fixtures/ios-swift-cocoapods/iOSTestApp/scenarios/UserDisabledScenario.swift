//
// Created by Jamie Lynch on 23/03/2018.
// Copyright (c) 2018 Bugsnag. All rights reserved.
//

import Foundation
import Bugsnag

/**
 * Sends a handled error to Bugsnag, which does not include user data.
 */
internal class UserDisabledScenario: Scenario {
    override func startBugsnag() {
      self.config.shouldAutoCaptureSessions = false;
      super.startBugsnag()
    }

    override func run() {
        Bugsnag.configuration()?.setUser(nil, withName: nil, andEmail: nil)
        let error = NSError(domain: "UserDisabledScenario", code: 100, userInfo: nil)
        Bugsnag.notifyError(error)
    }

}
