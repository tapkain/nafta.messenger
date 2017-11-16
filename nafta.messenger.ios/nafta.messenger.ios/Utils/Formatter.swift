//
//  Formatter.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/13/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

class Formatter {
  static var dateFormatter: DateFormatter {
    let df = DateFormatter()
    df.dateStyle = .short
    return df
  }
}
