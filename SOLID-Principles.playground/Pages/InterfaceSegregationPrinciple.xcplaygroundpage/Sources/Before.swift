import Foundation

fileprivate struct Store {}

fileprivate protocol StoresViewModelDelegate {
    func showLoading()
    func hideLoading()
    func didLoadStores(_ stores: [Store])
    func didFailLoadingStores(error: Error)
}

fileprivate class StoresMapViewController: StoresViewModelDelegate {
    func showLoading() {}
    func hideLoading() {}
    func didLoadStores(_ stores: [Store]) {}
    func didFailLoadingStores(error: Error) {}
}
