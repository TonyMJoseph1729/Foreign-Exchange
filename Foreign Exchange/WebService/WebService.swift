
import Foundation

class WebService {
    
    let fixerAccessKey = Environment.apiKey
    let baseURL = Environment.rootURL
    static let shared = WebService()
    
    func fetchCurrencyDetails(completion:@escaping (Result<CurrencyDetails,Error>) -> Void) {
        
        BaseWebService.shared.makeRequest(toURL: URL(string: "\(baseURL)latest?access_key=\(fixerAccessKey)")!, withHttpMethod: .get) { (result: Result<CurrencyDetails,Error>) in
            
            switch result {
            case .success(let currencyDetails):
                completion(.success(currencyDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func fetchComparisonData(currency1: String, currency2: String, date:String, completion:@escaping (Result<CurrencyComparisonDetails,Error>) -> Void) {
        BaseWebService.shared.makeRequest(toURL: URL(string: "\(baseURL)\(date)?access_key=\(fixerAccessKey)&symbols=\(currency1),\(currency2)")!, withHttpMethod: .get) { (result: Result<CurrencyComparisonDetails,Error>) in
            
            switch result {
            case .success(let comparisonDetails):
                completion(.success(comparisonDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
