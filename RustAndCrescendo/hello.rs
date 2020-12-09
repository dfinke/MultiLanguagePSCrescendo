use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    
    let name = &args[1];
    let age  = &args[2];
 
    println!("name = {}", name);
    println!("age = {}", age);
}