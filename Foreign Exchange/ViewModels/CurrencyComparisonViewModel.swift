
import Foundation

class CurrencyComparisonViewModel {
    
    let date: String?
    let currency1Rate: String?
    let currency2Rate: String?
    
    init ( date: String, currency1: Double, currency2: Double, amount: Double) {
        self.date = date
        self.currency1Rate = String(format: "%.2f", currency1*amount) //rounding off to two decimal points
        self.currency2Rate = String(format: "%.2f", currency2*amount) //rounding off to two decimal points
    }
}
