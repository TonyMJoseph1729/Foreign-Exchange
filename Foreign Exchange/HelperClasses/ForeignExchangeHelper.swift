
import Foundation

class ForeignExchangeHelper {
    
    static let shared = ForeignExchangeHelper()
    
    //Currencies available for comparison
    func availableCurrencies() -> [Currency] {
        let usd = Currency(currency: CurrencyConstants.usd, isSelected: false)
        let gbp = Currency(currency: CurrencyConstants.gbp, isSelected: false)
        let jpy = Currency(currency: CurrencyConstants.jpy, isSelected: false)
        let aud = Currency(currency: CurrencyConstants.aud, isSelected: false)
        let cad = Currency(currency: CurrencyConstants.cad, isSelected: false)
        let chf = Currency(currency: CurrencyConstants.chf, isSelected: false)
        let cny = Currency(currency: CurrencyConstants.cny, isSelected: false)
        let sek = Currency(currency: CurrencyConstants.sek, isSelected: false)
        let nzd = Currency(currency: CurrencyConstants.nzd, isSelected: false)
        let currencies = [usd,gbp,jpy,aud,cad,chf,cny,sek,nzd]
        return currencies
    }
    
    
    //Get date String from date
    func fetchDateString(_ daysFromCurrentDate: Int) -> String {
        let date = Date().addingTimeInterval(TimeInterval(-daysFromCurrentDate*86400))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)

        return dateString
    }
    
    // API Error Messages based on code (There is mismatch in the message info key)
    func apiErrorMessage(code: Int) -> String {
        switch code {
        case 404:
            return APIErrorMessageConstants.errorMessage404
        case 101:
            return APIErrorMessageConstants.errorMessage101
        case 103:
            return APIErrorMessageConstants.errorMessage103
        case 104:
            return APIErrorMessageConstants.errorMessage104
        case 105:
            return APIErrorMessageConstants.errorMessage105
        case 106:
            return APIErrorMessageConstants.errorMessage106
        case 102:
            return APIErrorMessageConstants.errorMessage102
        case 201:
            return APIErrorMessageConstants.errorMessage201
        case 202:
            return APIErrorMessageConstants.errorMessage202
        case 301:
            return APIErrorMessageConstants.errorMessage301
        case 302:
            return APIErrorMessageConstants.errorMessage302
        case 403:
            return APIErrorMessageConstants.errorMessage403
        case 501:
            return APIErrorMessageConstants.errorMessage501
        case 502:
            return APIErrorMessageConstants.errorMessage502
        case 503:
            return APIErrorMessageConstants.errorMessage503
        case 504:
            return APIErrorMessageConstants.errorMessage504
        case 505:
            return APIErrorMessageConstants.errorMessage505

        default:
            return "Some Error Occured"
        }
    }

}


