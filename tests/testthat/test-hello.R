test_that("hello greets by name", {
    expect_identical(hello("world"), "Hello, world!")
})

test_that("hello rejects a name that isn't a single string", {
    for (bad in list(NA_character_, character(0), c("a", "b"), 1, NULL)) {
        expect_error(hello(bad), "single, non-missing character string")
    }
})
