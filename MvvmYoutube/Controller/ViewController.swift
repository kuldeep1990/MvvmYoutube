//
//  ViewController.swift
//  MvvmYoutube
//
//  Created by KULDEP KUMAR PRAJAPATI on 26/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var movieTableView: UITableView!
    var arrMovieVM = [MovieViewModel]()
    var arrMovieList = [MovieViewModel]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.movieTableView.register(UITableView.self, forCellReuseIdentifier: "cell")
        self.getData()
        searchBarSetup()
        
    }

    func getData() {
        Service.shareInstance.getAllMovieData{ (movies, error) in
            if(error == nil){
                self.arrMovieVM = movies?.map({ return MovieViewModel(movie: $0)}) ?? []
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            }else{
                print(movies)
            }
        }
    }
    
    func dataList() -> [MovieViewModel] {
        if arrMovieList.count > arrMovieVM.count {
            arrMovieVM = arrMovieList
        }else{
        arrMovieList = arrMovieVM
        }
        return arrMovieVM
    }
    
    private func searchBarSetup() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self as? UISearchBarDelegate
        navigationItem.searchController = searchController
    }

}


extension ViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        if searchText == ""{
            dataList()
        }else{
            dataList()
            arrMovieVM = arrMovieVM.filter{ ($0.artistName?.contains(searchText))!}
        }
        movieTableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let viewModel = arrMovieVM[indexPath.row]
            cell.textLabel?.text = viewModel.artistName ?? ""
            cell.detailTextLabel?.text = viewModel.trackName ?? ""

            return cell
        }
        
        

}

