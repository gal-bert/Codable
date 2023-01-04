import UIKit

//struct Character: Codable {
//    var name: String
//    var status: String
//    var species: String
//}
//
//let endpoint = "https://rickandmortyapi.com/api/character/1"
//let url = URL(string: endpoint)
//let request = URLRequest(url: url!)
//
//let task = URLSession.shared.dataTask(with: request) {data, response, error in
//    if let data = data {
//        let decoder = JSONDecoder()
//        do {
//            let json: Character = try decoder.decode(Character.self, from: data)
//            print(json.name)
//            print(json.species)
//            print(json.status)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//task.resume()

struct Character: Codable {
    var name: String
    var status: String
    var species: String
}

let endpoint = "https://rickandmortyapi.com/api/character/1,2,3,4,5"
let url = URL(string: endpoint)
let request = URLRequest(url: url!)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    if let data = data {
        do {
            let characters = try JSONDecoder().decode([Character].self, from: data)
            for character in characters {
                print(character.name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

task.resume()

