# BunBo

This is a simple test generator for ruby code. The gem currently is a
work-in-progress. The functionality it intends to deliver:

- [x] Create new test file from existing ruby file
- [ ] Populate test file with `describe` block for class/module
- [ ] Populate test file with `describe` block for each method
- [ ] Support both minitest and rspec

## Installation

Or install it yourself as:

```shell
$ gem install bun_bo
```

## Usage

```shell
bun_bo <file_name>
```

Example:

```shell
bun_bo lib/bun_bo.rb
```

The above command will create a new test file in `spec/lib/bun_bo_spec.rb`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hieuk09/bun_bo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
