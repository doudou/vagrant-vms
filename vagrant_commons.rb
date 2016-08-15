require 'yaml'
require 'pathname'

module VagrantCommons
    CONFIG = YAML.load((Pathname.new(__dir__) + "config.yml").read)

    def self.ubuntu_archive_url
        "#{CONFIG['ubuntu_country']}.archive.ubuntu.com"
    end
end
