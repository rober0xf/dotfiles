to remove a prefix we can use the `removeprefix` method.
`google_url = "https://google.com"`
`google_url.removeprefix("https://") -> google.com`
we need to consider that the `removeprefix` method is not in place.

to remove a suffix we can use the `removesuffix` method.
`file_path = "/home/desktop/model.pt"`
`file_path.removesuffix(".pt") -> "/home/desktop/model"`
its also not in place.