//
//  PayTimeModel.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/26.
//

enum TimeCheker {
    case second //second 1뺄때
    case minute
    case hour
    case end
}

extension TimeCheker {
    var secondResult: Int {
        switch self {
        case .second:
            return -1
        case .minute:
            return 58
        case .hour:
            return 58
        case .end:
            return 0
        }
    }
    
    var minuteResult: Int {
        switch self {
        case .second:
            return 0
        case .minute:
            return -1
        case .hour:
            return 58
        case .end:
            return 0
        }
    }
    
    var hourResult: Int {
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
        
        let currentSecond = second + self.secondResult
        let currentMinute = minute + self.minuteResult
        let currentHour = hour + self.hourResult
        return "\(currentHour):\(currentMinute):\(currentSecond) 남음"
    }
}
