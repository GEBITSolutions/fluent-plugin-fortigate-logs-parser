require 'fluent/test'
require 'fluent/test/base'
require 'fluent/test/parser_test'
require 'fluent/test/helpers'
require 'fluent/test/driver/parser'
require 'fluent/test/driver/base'
require 'fluent/test/driver/output'
require 'fluent/plugin/out_file'
require 'fluent/plugin/parser'
require './lib/fluent/plugin/parser_fortigate_logs'

require 'test-unit'

class MyParserTest < Test::Unit::TestCase
include Fluent::Test::Helpers

  setup do
    Fluent::Test.setup
  end

  def create_driver(conf={})
    Fluent::Test::Driver::Parser.new(Fluent::Plugin::FortigateLogs).configure(conf)
  end

  def create_parser(conf={})
    create_driver(conf).instance
  end

  test "parse_sample" do
      sample_input = '<199>date=2023-01-04 time=00:31:55 devname="fortigate01" devid="FG6H0" eventtime=1672788710057556994 tz="+0100" logid="0000000007" type="traffic" subtype="forward" level="warning" vd="root" srcip=192.168.0.32 srcname="192.168.0.32" srcport=57451 srcintf="VLAN_192" srcintfrole="lan" dstip=10.10.10.10 dstname="10.10.10.10" dstport=80 dstintf="VLAN_192" dstintfrole="lan" srccountry="Reserved" dstcountry="Reserved" sessionid=36192140 proto=6 action="deny" policyid=0 policytype="policy" service="HTTP" trandisp="noop" duration=0 sentbyte=0 rcvdbyte=0 sentpkt=0 rcvdpkt=0 msg="Denied by forward policy check (policy 0)"'
      create_parser().parse(sample_input) do |time, record|
        assert_equal(event_time("2023-01-04 00:31:55"), time, "not equal time")
        assert_match(/FG.*/, record["devid"], "not equal record")
        assert_equal("Denied by forward policy check (policy 0)", record["msg"], "not equal record")
      end
  end

  test "parser_exception" do
      assert_raise do
        create_parser().parse('') do |time, record|
          assert_equal(event_time("2023-01-04 00:31:55"), time, "not equal time")
        end
      end
  end

end

