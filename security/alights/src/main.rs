use serde::{Serialize, Deserialize};
use serde_json;

#[derive(Serialize, Deserialize, Debug)]
struct Person {
    name: String,
    age: u32,
}

fn main() {
    let person = Person {
        name: "Alice".to_string(),
        age: 30,
    };

    // Convert the person to a JSON string
    let json = serde_json::to_string(&person).unwrap();
    println!("JSON: {}", json);
}
