module LogRecursive
  class Logs
    def initialize(changes)
      @changes = changes
    end

    def logs
      changes.map do |name, keys|
        ref_range = "#{keys['-']}..#{keys['+']}"
        directory = config.known_gems[name]

        { name: name,
          ref_range: ref_range,
          directory: directory,
          log: Dir.chdir(directory) { `git log #{ref_range} #{format} 2>&1` }
        }
      end
    end

    def output
      logs.each do |log|
        puts '================================================================================'
        puts "# #{log[:name]} (#{log[:ref_range]})"
        puts '--------------------------------------------------------------------------------'
        puts log[:log]
        puts
      end
    end

    private

    attr_reader :changes

    def config
      LogRecursive::Config.new
    end

    def format
      '--graph --format=format:"%h - (%ad) %s <%an>" --date=short'
    end
  end
end
