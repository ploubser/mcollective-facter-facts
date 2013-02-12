module MCollective
  module Facts
    require 'facter'

    # A factsource for Puppet Labs Facter
    #
    # This plugin by default works with puppet facts loaded via pluginsync
    # and the deprecated factsync. If your facts are in a custom location, or
    # you use non-standard puppet dirs, then set plugin.facter.facterlib
    # in the server.cfg
    class Facter_facts<Base
      def load_facts_from_source
        ENV['FACTERLIB'] = Config.instance.pluginconf["facter.facterlib"] || "/var/lib/puppet/lib/facter:/var/lib/puppet/facts"

        Log.debug("Have FACTERLIB: #{ENV['FACTERLIB']}")

        ::Facter.reset

        facts = ::Facter.to_hash

        Log.info("Loaded #{facts.keys.size} facts from Facter")

        facts
      end
    end
  end
end
