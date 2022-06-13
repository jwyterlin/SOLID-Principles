import Foundation

fileprivate class ProductsViewController {

    var products: [Product] = []

    func loadProducts() {}

    func showLoading() {}

    func hideLoading() {}

    func updateList() {}

    func addProduct(product: Product) {}

    func removeProduct(product: Product) {}

    func saveProducts() {
        // Save products using Core Data
    }

    func sendAnalyticsEvent() {}

}

fileprivate struct Product {}
