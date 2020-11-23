
import UIKit
import SwiftSpinner

class CurrencyDetailsViewController: UIViewController {
    
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var currencyValueTextField: UITextField!
    @IBOutlet weak var currencyDetailsTableView: UITableView!
    
    var currencies = ForeignExchangeHelper.shared.availableCurrencies()
    var currencyAmount = 1.00
    var comparingCurrencies : [Currency] = []
    var currencyDetails: CurrencyDetails?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyValueTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        fetchData()
    }
    
    //show activity indicator
    func initializeProgressHUD() {
        SwiftSpinner.show(AlertConstants.fetchingRatesMessage)
    }
    
    // Refresh the conversion amount based on the amount entered
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let amount = textField.text {
            currencyAmount = Double(amount) ?? 1.00
            DispatchQueue.main.async {
                self.currencyDetailsTableView.reloadData()
            }
            //to avoid selected currencies to be unselected after tableview reload
            for i in currencies {
                if let row = currencies.firstIndex(of: i) {
                    let indexPath = IndexPath(row: row, section: 0)
                    currencyDetailsTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                }
            }
        }
        
    }
    
    // Call API again to fetch conversion Data
    @IBAction func ReloadButtonTapped(_ sender: Any) {
        compareButton.isEnabled = false
        currencies = ForeignExchangeHelper.shared.availableCurrencies()
        self.currencyDetailsTableView.isHidden = true
        self.comparingCurrencies = []
        fetchData()
    }
    
    //Compare Button Action : Take to the comparison Screen
    @IBAction func compareButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: UIConstants.currencyComparisonVCIdentifier) as! CurrencyComparisonViewController
        vc.comparingCurrencies = comparingCurrencies
        vc.amount = currencyAmount
        navigationController?.pushViewController(vc,
                                                 animated: true)
        
    }
    
    //Enable compare button when two currencies are selected
    func enableCompareButton() {
        if (comparingCurrencies.count == 2) {
            compareButton.isEnabled = true
        } else {
            compareButton.isEnabled = false
        }
    }
    
    //WebService Call to fetch conversion Rates
    func fetchData() {
        initializeProgressHUD()
        
        WebService.shared.fetchCurrencyDetails { [weak self] result in
            SwiftSpinner.hide()
            switch result {
            case .success(let details):
                guard let success = details.success else {
                    return
                }
                if success {
                    self?.currencyDetails = details
                    DispatchQueue.main.async {
                        self?.currencyDetailsTableView.isHidden = false
                        self?.currencyDetailsTableView.reloadData()
                    }
                } else {
                    guard let errorCode = details.error?.code else {
                        return
                    }
                    self?.showAlert(title: ErrorConstants.errorTitle,message:ForeignExchangeHelper.shared.apiErrorMessage(code: errorCode))
                    
                }
            case .failure(let error):
                self?.showAlert(title: ErrorConstants.errorTitle,message:error.localizedDescription)
            }
        }
        
    }
    
}


