//
//  Third_ViewController.swift
//  prova_esame
//
//  Created by ifts26 on 21/11/22.
//

import UIKit

class Third_ViewController: UIViewController {

    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var descrizione: UITextView!
    
    var datiFilm: Film?
    var datiSerieTv: SerieTv?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(datiFilm ?? "film vuoto")
        print(datiSerieTv ?? "serie vuoto")
        
        inserimentoDati()
    }
    
    func inserimentoDati() {
        if datiFilm == nil {
            titolo.text = datiSerieTv?.titolo_serietv
            descrizione.text = datiSerieTv?.descrizione_serietv
        } else {
            titolo.text = datiFilm?.titolo_film
            descrizione.text = datiFilm?.descrizione_film
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if datiFilm?.titolo_film == "" {
            datiSerieTv?.titolo_serietv.removeAll()
            datiSerieTv?.descrizione_serietv.removeAll()
        } else {
            datiFilm?.titolo_film.removeAll()
            datiFilm?.descrizione_film.removeAll()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
