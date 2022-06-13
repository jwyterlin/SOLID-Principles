import Foundation

fileprivate struct Product {}

// MARK: ViewController only cares about updating its UI

fileprivate class ProductsViewController {

    func showLoading() {}

    func hideLoading() {}

    func updateList() {}

}

// MARK: We separate each responsibility for each service, analytics or core data layer

fileprivate struct ProductsViewModel {

    private var products: [Product] = []
    private let addProductService: AddProductService
    private let removeProductService: RemoveProductService
    private let analytics: Analytics
    private let productDatabase: ProductCoreData

    mutating func loadProducts() {
        let productsFromDatabase = productDatabase.loadProducts()
        products = productsFromDatabase
    }

    func addProduct(product: Product) {
        addProductService.addProduct(product: product)
    }

    func removeProduct(product: Product) {
        removeProductService.removeProduct(product: product)
    }

    func saveProducts() {
        productDatabase.saveProducts(products)
    }

    func sendAnalyticsEvent() {
        analytics.sendEvent()
    }

}

// MARK: Service Layer

fileprivate struct AddProductService {
    func addProduct(product: Product) {
        // A request to API to add product
    }
}

fileprivate struct RemoveProductService {
    func removeProduct(product: Product) {
        // A request to API to remove product
    }
}

// MARK: Core Data Layer

fileprivate struct ProductCoreData {

    func loadProducts() -> [Product] {
        // Retrieves products from local database using Core Data
        return []
    }

    func saveProducts(_ products: [Product]) {
        // Save products using Core Data
    }

}

// MARK: Analytics Layer

fileprivate struct Analytics {
    func sendEvent() {
        // Send event to Analytics
    }
}
