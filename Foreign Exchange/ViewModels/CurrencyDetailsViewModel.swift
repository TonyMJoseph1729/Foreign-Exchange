
import Foundation

class CurrencyDetailsViewModel {
    var currency: String?
    var convertedAmount: String?
    var isSelected: Bool
    
    init( currency: Currency, conversionRate: Double, amount: Double) {
        self.currency = currency.currency
        self.convertedAmount = String(format: "%.2f", conversionRate * amount) //rounding off to two decimal points
        self.isSelected = currency.isSelected
        
    }
}
