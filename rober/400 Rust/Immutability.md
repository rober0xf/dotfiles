when we do: `let mut guess = String::new()` and then we want to input to that variable, we need to pass the parameter also like a mutable. because **references are immutable by default** also.
`io::stdin().read_line(&mut guess).expect("failed to read input")`
