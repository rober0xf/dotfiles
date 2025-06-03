we can define a random number using the rand crate.
`let secret_number = rand::thread_rng().gen_range(1..=100);`
here we use `rand::thread_rng` to generate random number that is local to the current thread, seeded by the operating system.

we have a library to do comparison, which is `std::cmp::Ordering`, there are methods like: `Ordering::Less => do_someting,`
`Ordering::Greater => do_something,`
`Ordering::Equal => do_something,`
we can use it in a match statement like this: `match variable.cmp(&reference){}`
