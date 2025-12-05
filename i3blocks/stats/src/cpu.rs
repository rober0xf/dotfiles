use std::{thread, time::Duration};

use sysinfo::System;

pub fn cpu_usage() -> f32 {
    let mut sys = System::new();
    sys.refresh_cpu_all();
    thread::sleep(Duration::from_millis(200));
    sys.refresh_cpu_all();

    // sum all cores
    let cpus = sys.cpus();
    let total_usage: f32 = cpus.iter().map(|cpu| cpu.cpu_usage()).sum();

    total_usage / cpus.len() as f32
}
