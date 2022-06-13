import Foundation

fileprivate class PaymentManager {

    func makePayment() {
        let paymentType = ""
        let amount = 19.99
        if paymentType == "cash" {
            makeCashPayment(amount: amount)
        } else if paymentType == "visa" {
            makeVisaPayment(amount: amount)
        } else if paymentType == "mc" {
            makeMasterCardPayment(amount: amount)
        } else if paymentType == "amex" {
            makeAmexPayment(amount: amount)
        }
    }

    func makeCashPayment(amount: Double) {
        // perform payment with cash
    }

    func makeVisaPayment(amount: Double) {
        // perform payment with Visa
    }

    func makeMasterCardPayment(amount: Double) {
        // perform payment with Master Card
    }

    func makeAmexPayment(amount: Double) {
        // perform payment with American Express
    }

}
