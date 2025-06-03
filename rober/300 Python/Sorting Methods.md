suppose we have a list, `using list.sort()` will sort it in place
`cars = ["bmw", "audi", "volkswagen", "benz"]`
`cars.sort()`
now cars will look like: `['audi', 'benz', 'bmw', 'volkswagen']`

we can also use the parameter `reverse=True`

if we want to sort not in place we can use `sorted(cars)`
and it also provides the `reverse=True`