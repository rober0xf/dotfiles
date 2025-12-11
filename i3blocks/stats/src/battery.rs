use battery::{Manager, State};

pub fn battery_info() -> (usize, &'static str, &'static str) {
    let manager = Manager::new().unwrap();
    let bat = manager.batteries().unwrap().next().unwrap().unwrap();
    let percentaje = (bat.state_of_charge().value * 100.0) as usize;

    let color = match percentaje {
        0..=10 => "#ff0000",  // red
        11..=30 => "#ff8800", // orange
        31..70 => "#ffff00",  // yellow
        _ => "#00ff00",       // green
    };

    let status = match bat.state() {
        State::Charging => "CHR",
        State::Discharging => "DIS",
        State::Full => "FULL",
        _ => "UNK",
    };

    (percentaje, color, status)
}
