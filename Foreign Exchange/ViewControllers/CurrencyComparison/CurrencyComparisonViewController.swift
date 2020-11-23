
import UIKit
import SwiftSpinner

class CurrencyComparisonViewController: UIViewController {
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    
    @IBOutlet weak var currencyComparisonTableView: UITableView!
    var comparingCurrencies:[Currency] = [] //currencies to be compared
    var amount: Double = 1.0 //amount of Euro
    var comparisonDetails : [CurrencyComparisonDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProgressHUD()

        baseCurrencyLabel.text = "\(String(format: "%.2f", amount)) \(CurrencyConstants.eur)"
        fetchComparisonDates()
        setupInitialUI()
        // Do any additional setup after loading the view.
    }
    
    // display currencies to be compared
    func setupInitialUI() {
        currency1Label.text = comparingCurrencies.first?.currency
        currency2Label.text = comparingCurrencies.last?.currency
    }
    
    // show activitiy Indicator
    func initializeProgressHUD() {
        SwiftSpinner.show(AlertConstants.comparingRatesMessage)

    }
    

    // Webservice call to fetch currency rate for last five days
    func fetchComparisonDates() {
        let dispatchQueue = DispatchQueue(label: "comparingQueue", qos: .background)
        let semaphore = DispatchSemaphore(value: 0)

        dispatchQueue.async {
        // API call to fetch conversion date based on dates
        for i in 0...4 {
            let date = ForeignExchangeHelper.shared.fetchDateString(i)
            guard let currency1 = self.comparingCurrencies.first?.currency, let currency2 = self.comparingCurrencies.last?.currency else {
                self.showAlert(title: ErrorConstants.errorTitle, message: ErrorConstants.genericErrorMessage)
                return
            }
            WebService.shared.fetchComparisonData(currency1: currency1, currency2: currency2, date: date) { [weak self] result in
                semaphore.signal()

                switch result {
                case .success(let comparisonDetails):
                    guard let success = comparisonDetails.success else {
                        return
                    }
                    if success {
                        self?.comparisonDetails.append(comparisonDetails)
                    } else {
                        if let errorCode = comparisonDetails.error?.code {
                            self?.showAlert(title: ErrorConstants.errorTitle,message:ForeignExchangeHelper.shared.apiErrorMessage(code: errorCode))
                        }
                    }

                case .failure(let error):
                    self?.showAlert(title: ErrorConstants.errorTitle,message:error.localizedDescription)

                }
            }
            semaphore.wait()
        }
            DispatchQueue.main.async {
                SwiftSpinner.hide()
                self.currencyComparisonTableView.isHidden = false
                self.currencyComparisonTableView.reloadData()
                
            }
        }
    }
    
}
