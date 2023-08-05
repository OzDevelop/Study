
import Foundation
import SwiftUI

struct LottoData: Identifiable {
    var id: UUID = UUID()
    var FirstNum: Int
    var LastNum: Int
    var result: [Int] = []
    
    init(FirstNum: Int = 1, LastNum: Int = 45) {
        self.FirstNum = FirstNum
        self.LastNum = LastNum
        generateResult()
    }
    
//    var color: Color {
//        return determineColor()
//    }
    
    var color: [Color] {
        return determineColors()
    }
    
    // 랜덤 숫자는 출력되지만 중복 체크가 되지 않음
//    private mutating func generateResult() {
//        result = (0..<6).map { _ in
//            (FirstNum...LastNum).randomElement()!
//        }
//    }
    
    // set을 이용한 방법
//    private mutating func generateResult() {
//        var randomNumbers: Set<Int> = []
//        while randomNumbers.count < 6 {
//            let number = Int.random(in: FirstNum...LastNum)
//            randomNumbers.insert(number)
//        }
//        result = Array(randomNumbers)
//    }
    
    private mutating func generateResult() {
        while result.count < 6 {
            let number = Int.random(in: FirstNum...LastNum)
            if !result.contains(number) {
               
                result.append(number)
            }
        }
        result.sort()
    }
    
    
    private func determineColors() -> [Color] {
        return result.map { number in
            determineColor(for: number)
        }
    }
    
//    private func determineColor() -> Color {
//           guard let firstNumber = result.first else {
//               return .black
//           }
//
//        switch firstNumber {
//        case 1...10:
//            return .yellow
//        case 11...20:
//            return .blue
//        case 21...30:
//            return .orange
//        case 31...40:
//            return .green
//        case 41...45:
//            return .purple
//        default:
//            return .black
//        }
//    }
    
    private func determineColor(for number: Int) -> Color {
        switch number {
        case 1...10:
            return .yellow
        case 11...20:
            return .blue
        case 21...30:
            return .orange
        case 31...40:
            return .green
        case 41...45:
            return .purple
        default:
            return .black
        }
    }
}
