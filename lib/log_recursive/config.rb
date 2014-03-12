require 'pathname'

module LogRecursive
  class Config
    def initialize(path = nil)
      @path = path ? Pathname.new(path) : Pathname.new(Dir.pwd)

      raise "Could not find config, do you have a .logr file somewhere in the directory hierarchy?" unless config_exists?
    end

    def known_gems
      self_gem.merge(File.open(config_path) do |file|
        Hash[
          file.lines.map { |line| line.strip.split('=', 2) }
        ]
      end)
    end

    private

    def self_gem
      { Pathname.new(Dir.pwd).basename.to_s => "." }
    end

    def config_path
      unless @config_path
        dir = path
        while @config_path == nil && File.expand_path(dir) != '/' do
            potential_config_path = File.expand_path('.logr', dir)
            @config_path = potential_config_path if File.exists?(potential_config_path)
            dir = File.join(dir, '..')
        end
      end

      @config_path
    end

    def config_exists?
      File.exists? config_path
    end

    def path
      @path
    end
  end
end
