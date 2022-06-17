
import Foundation
struct Airline : Codable {
	let id : Int
	let name : String
	let country : String
	let logo : String
	let slogan : String
	let head_quaters : String
	let website : String
	let established : String

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case country = "country"
		case logo = "logo"
		case slogan = "slogan"
		case head_quaters = "head_quaters"
		case website = "website"
		case established = "established"
	}
}
