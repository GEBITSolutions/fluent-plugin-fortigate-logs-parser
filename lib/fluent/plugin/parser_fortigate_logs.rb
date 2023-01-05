module Fluent::Plugin
  class FortigateLogs < Parser
    Fluent::Plugin.register_parser('fortigate_logs', self)
    config_param :headerDelimiter, :string, default: '<([0-9]){3}>'
    config_param :delimiter, :string, default: '\\s(?=(?:[^\\"]*\\"[^\\"]*\\")*[^\\"]*$)'
    config_param :separator, :string, default: "="

    def configure(conf)
      super
      @time_parser = Fluent::TimeParser.new(@time_format)
    end

    def parse(logContent)
      record ={}
      begin

      _, _, recordSet = logContent.split(/#{Regexp.new(@headerDelimiter)}/)
      
      recordSet.split(/#{Regexp.new(@delimiter)}/).each { |kv|
         k, v = kv.split(@separator, 2)
         record[k] = v.delete_prefix('"').delete_suffix('"')
        }

      time = @time_parser.parse(record.values[0]+' '+record.values[1])
      
      rescue StandardError => e
        time = Time.now
        record[0]=DateTime.now
        record[1]=Time.now
        record[2]= "Unable to parse the record due to error: "+e.full_message
        record[3]= "Error inspection: "+e.backtrace.inspect.to_str()
        record[4]= logContent
      end

      yield time, record
    end

  end
end