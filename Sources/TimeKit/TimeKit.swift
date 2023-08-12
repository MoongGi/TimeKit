
import Foundation

public struct TimeKit {
    
    /*
        현재 기준 일자 가져오기
        가져올때 원하는 포멧으로 가져올수 있음.
        ex: getNowDate(time: [.YYYY, .MM], separator: ".")
            -> 2023.04
     */
    public static func getNowDate(time: [TimeType], separator: String) -> String {
        let formatter = DateFormatter()
        var timeStrings: [String] = []
        for i in 0..<time.count {
            timeStrings.append(time[i].rawValue)
        }
        
        formatter.dateFormat = timeStrings.joined(separator: separator)
        formatter.locale = Locale(identifier: "ko_KR")
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    
    /*
         일자 더하기 빼기
         가져올때 원하는 포멧으로 가져올수 있음.
         ex: getAddDate(day: 3, time: [.YYYY, .MM, .dd], separator: "")
     */
    public static func getAddDate(day: Int, time: [TimeType], separator: String) -> Int? {
        let now = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        var timeStrings: [String] = []
        for i in 0..<time.count {
            timeStrings.append(time[i].rawValue)
        }
        
        dateFormatter.dateFormat = timeStrings.joined(separator: separator)
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        let plusDay = DateComponents(day: day)
        let resultDate = Int(dateFormatter.string(from: calendar.date(byAdding: plusDay, to: now) ?? Date()))
        
        return resultDate
    }
    
    /*
         월 더하기 빼기
         가져올때 원하는 포멧으로 가져올수 있음.
         ex: getCalculationMonth(day: 3, time: [.YYYY, .MM, .dd], separator: "")
     */
    public static func getCalculationMonth(months: Int, time: [TimeType], separator: String) -> String? {
        let date = Date()
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        let dateFormatter = DateFormatter()
        dateComponents.month = months

        var timeStrings: [String] = []
        for i in 0..<time.count {
            timeStrings.append(time[i].rawValue)
        }
        
        dateFormatter.dateFormat = timeStrings.joined(separator: separator)
        
        let resultDate = String(dateFormatter.string(from: calendar.date(byAdding: dateComponents, to: date) ?? Date()))
        
        return resultDate
    }
    
    // 현재 월 기준 말일 가져오기
    public static func getLastDayOfMonth() -> Int? {
        
       let calendar = Calendar.current
       let date = Date()
       let components = calendar.dateComponents([.year, .month], from: date)
       
       if let range = calendar.range(of: .day, in: .month, for: date) {
           return range.upperBound - 1
       }
       
       return nil
    }
}
