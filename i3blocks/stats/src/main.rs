use std::env;

use crate::{battery::battery_info, cpu::cpu_usage, ram::ram_usage};

mod battery;
mod cpu;
mod ram;

fn main() {
    // we are calling the same binary so we need to use it like a cli
    let args = env::args().nth(1).unwrap_or_else(|| "cpu".to_string());

    match args.as_str() {
        "cpu" => println!("CPU: {:.1}%", cpu_usage()),
        "ram" => println!("RAM: {:.1}%", ram_usage()),
        "bat" => {
            let (percentaje, color) = battery_info();
            println!("BAT: {}", percentaje);
            println!("{}", percentaje);
            println!("{}", color);
        }
        _ => eprintln!("unknown: {}", args),
    }
}
