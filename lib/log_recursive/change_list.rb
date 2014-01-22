module LogRecursive
  class ChangeList
    def initialize(ref_range)
      @ref_range = ref_range
    end

    def changes
      hash = {}
      raw_git_changes.scan(/^(\-|\+)\s+([a-z_\-]+)\s+\(([\da-z\.]+)\)$/i).each do |match|
        # 0 = direction, 1 = gem name, 2 = version
        hash[match[1]] ||= {}
        hash[match[1]].store(match[0], "v#{match[2]}")
      end
      hash
    end

    def known_changes
      self_changes.merge changes.select{|k,_| config.known_gems.has_key?(k)}
    end

    private

    def self_changes
      {
        Pathname.new(Dir.pwd).basename.to_s => {
          "-" => oldest_ref,
          "+" => latest_ref
        }
      }
    end

    # TODO dirty, should be injected or lookup
    def config
      LogRecursive::Config.new
    end

    def oldest_ref
      ref_range.split("..").first
    end

    def latest_ref
      ref_range.split("..").last
    end

    def ref_range
      @ref_range
    end

    def raw_git_changes
      `git diff --no-color #{ref_range} -- Gemfile.lock`
    end
  end
end
