use sysinfo::System;

pub fn ram_usage() -> f32 {
    let mut system = System::new_all();
    system.refresh_all();

    let used = system.used_memory() as f32;
    let total = system.total_memory() as f32;
    (used / total) * 100.0
}
