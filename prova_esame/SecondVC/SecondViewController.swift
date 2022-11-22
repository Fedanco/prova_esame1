//
//  SecondViewController.swift
//  prova_esame
//
//  Created by ifts26 on 21/11/22.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FirstCollectionView: UITableView!
    @IBOutlet weak var SecondCollectionView: UITableView!
    
    var datiFilm: Film?
    var datiSerie: SerieTv?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == FirstCollectionView {
            return Data.share.film.count
        } else {
            return Data.share.serieTv.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == FirstCollectionView {
            let cell = FirstCollectionView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! Cell1_TableViewCell
            cell.filmImages.image = Data.share.film[indexPath.row].img_film
            return cell
        } else {
            let cell = SecondCollectionView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! Cell2_TableViewCell
            cell.serieImages.image = Data.share.serieTv[indexPath.row].img_serietv
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        if tableView == FirstCollectionView {
            print("1")
            datiFilm = Data.share.film[indexPath.row]
            performSegue(withIdentifier: "vamos", sender: indexPath)
        } else if tableView == SecondCollectionView {
            print("2")
            //print(Data.share.serieTv[indexPath.row])
            datiSerie = Data.share.serieTv[indexPath.row]
            //datiSerie = Data.share.serieTv[indexPath.row]
            performSegue(withIdentifier: "vamos", sender: indexPath)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vamos" {
            //guard let indexPath = sender as? IndexPath else {return}
            guard let dest = segue.destination as? Third_ViewController else {return}
            
            if datiFilm?.titolo_film == "" {
                dest.datiSerieTv = datiSerie
                pulisciArray()
            } else {
                dest.datiFilm = datiFilm
                pulisciArray()
            }
            
        }
    }
    
    func pulisciArray() {
        datiFilm?.titolo_film.removeAll()
        datiFilm?.descrizione_film.removeAll()
        datiSerie?.titolo_serietv.removeAll()
        datiSerie?.descrizione_serietv.removeAll()
        print("PULITO")
    }
    

}
