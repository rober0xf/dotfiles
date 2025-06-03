Having a list like:
`cars = ["bmw", "audi", "volkswagen", "mercedes benz"]`

we can delete using the index, using:
`del cars[1]`
cars will look like: `["bmw", "volkswagen", "mercedes benz"]`

we can remove the last item using:
`popped = cars.pop()`
cars will look like: `["bmw", "volkswagen"]`

we can remove by value. it will remove only the first appearance.
`cars.remove("bmw")`
cars will look like: `["volkswagen"]`