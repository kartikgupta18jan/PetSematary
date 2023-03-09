//
//  NSMutableData+Append.swif
//  NetworkLayer
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

extension NSMutableData {
  func append(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}
