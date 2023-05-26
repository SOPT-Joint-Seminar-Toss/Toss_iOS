//
//  PayTimeModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/26.
//

enum TimeCheker {
    case second
    case minute
    case hour
    case end
}

extension TimeCheker {
    var second: Int {
        switch self {
        case .second:
            return -1
        case .minute:
            return 59
        case .hour:
            return 59
        case .end:
            return 0
        }
    }
    
    var minute: Int {
        switch self {
        case .second:
            return 0
        case .minute:
            return -1
        case .hour:
            return 59
        case .end:
            return 0
        }
    }
    
    var hour: Int {
        switch self {
        case .second:
            return 0
        case .minute:
            return 0
        case .hour:
            return -1
        case .end:
            return 0
        }
    }
    
    func currentTime(hour: Int, minute: Int, second: Int) -> String {
        let currentSecond = second - self.second
        let currentMinute = minute - self.minute
        let currentHour = hour - self.hour
        return "\(currentHour):\(currentMinute):\(currentSecond) 남음"
    }
}
