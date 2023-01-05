# Fortigate Log Parser for Fluentd

[![Unit Tests](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/actions/workflows/unit-test.yml/badge.svg?branch=main)](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/actions/workflows/unit-test.yml)

This is a Fluentd plugin to parse the proprietary syslog messages from FortiOS (Fortigate). The plugin is based on a fork, with special thanks to 
[iliecz](https://github.com/iliecz/fluent-plugin-fortigate-syslog-parser).

## Requirements

| fluent-plugin-grok-parser | fluentd    | ruby   |
|---------------------------|------------|--------|
| >= 1.0.0                  | >= v0.15.0 | >= 3.1 |

## Installation

```bash
gem install fluent-plugin-fortigate-logs-parser
```

## Usage

Create a generic UDP input and use the `fortigate_logs` parser.
```aconf
<source>
  @type udp
  port 9910
  bind 0.0.0.0
  <parse>
    @type fortigate_logs
  </parse>
</source>
```
## Development

```bash
bin/setup
```

```bash
bundle exec rake test
```

## Contributing

We welcome community contributions to this collection.
If you find bugs, then please open an [issue](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/issues) or create a [pull request](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/pulls).

More information about contributing can be found in the [Contribution Guidelines](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/CONTRIBUTING).

## License

[MIT License](https://github.com/GEBITSolutions/fluent-plugin-fortigate-logs-parser/blob/main/LICENSE)

