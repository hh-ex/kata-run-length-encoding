# Run Length Encoding

Implement run-length encoding and decoding.

Run-length encoding (RLE) is a simple form of data compression, where runs
(consecutive data elements) are replaced by just one data value and count.

For example we can represent the original 53 characters with only 13.

```text
"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
```

RLE allows the original data to be perfectly reconstructed from
the compressed data, which makes it a lossless data compression.

```text
"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"
```

For simplicity, you can assume that the unencoded string will only contain
the letters A through Z (either lower or upper case) and whitespace. This way
data to be encoded will never contain any numbers and numbers inside data to
be decoded always represent the count for the following character.

## Running tests

Execute the tests with:

```bash
$ mix test
```

## Debugging

- Put `require Logger` at the top of the `RunLengthEncoding` module.
- Log values to the terminal using `Logger.debug inspect <variable>`.
- Use the interactive shell to try out things by running `iex -S mix`.


### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the `test/test_helper` file.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

You can also run all tests by running:
```
mix test --include pending
```

## Resources

- [Installing Elixir](https://elixir-lang.org/install.html)
- [Getting Started Guide](https://elixir-lang.org/getting-started/introduction.html)
- [Elixir Docs](https://hexdocs.pm/elixir)

More specific:
- [Guide/Basic types](https://elixir-lang.org/getting-started/basic-types.html#strings)
- [Guide/Pattern matching](https://elixir-lang.org/getting-started/pattern-matching.html)
- [Guide/case](https://elixir-lang.org/getting-started/case-cond-and-if.html)
- [Guide/Modules and functions](https://elixir-lang.org/getting-started/modules-and-functions.html)
- [Guide/Recursion](https://elixir-lang.org/getting-started/recursion.html)
- [Docs/Strings](https://hexdocs.pm/elixir/String.html)
- [Docs/Integer](https://hexdocs.pm/elixir/Integer.html)

Even more specific hints (links to functions):
- [Function](https://hexdocs.pm/elixir/String.html#split/3)
- [Function](https://hexdocs.pm/elixir/Integer.html#parse/2)
- [Function](https://hexdocs.pm/elixir/Enum.html#reduce/3)
- [Function](https://hexdocs.pm/elixir/Kernel.html#%3C%3E/2)

## Source

Wikipedia [https://en.wikipedia.org/wiki/Run-length_encoding](https://en.wikipedia.org/wiki/Run-length_encoding)

Adapted from the [Exercism Elixir Track](https://github.com/exercism/elixir).
