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
        hash[match[1]].store(match[0], match[2])
      end
      hash
    end

    private

    def ref_range
      @ref_range
    end

    def raw_git_changes
      `git diff --no-color #{ref_range} -- Gemfile.lock`
    end
  end
end
