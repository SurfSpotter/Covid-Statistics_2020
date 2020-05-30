//
//  LocalizeManager.swift
//  Covid_Stat_Ru
//
//  Created by Алексей Чигарских on 30.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

extension String {
    func loc() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
