
import Foundation
struct Data : Codable {
	let _id : String
	let name : String
	let trips : Int
	let airline : [Airline]
	let __v : Int

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case name = "name"
		case trips = "trips"
		case airline = "airline"
		case __v = "__v"
	}
}
