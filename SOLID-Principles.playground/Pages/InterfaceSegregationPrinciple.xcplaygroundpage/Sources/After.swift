fileprivate struct Store {}

fileprivate protocol LoadingDisplayable {
    func showLoading()
    func hideLoading()
}

fileprivate protocol StoreListFeedback {
    func didLoadStores(_ stores: [Store])
    func didFailLoadingStores(error: Error)
}

fileprivate protocol StoresViewModelDelegate: LoadingDisplayable, StoreListFeedback {}

fileprivate class StoresMapViewController: StoresViewModelDelegate {
    func showLoading() {}
    func hideLoading() {}
    func didLoadStores(_ stores: [Store]) {}
    func didFailLoadingStores(error: Error) {}
}
