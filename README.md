#Facter Fact Source

##Overview

The facter plugin enables mcollective to use facter as a source for facts about your system.

This plugin uses a 300 second cache for facts by default, after that it will reset facter and regenerate all the facts, this adds a second or so overhead to discovery.

This plugin is released as GPLv2 same as the license of facter.

Note: This method suffers from some issues due to how slow Facter can be in some cases, you should use Facter via YAML instead.

##Installation

* Follow the [basic plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins)

##Configuration

The following options can be set in server.cfg

* factsource - Sets the fact source.
* plugin.facter.facterlib - where to find custom facts. Defaults to /var/lib/puppet/lib/facter:/var/lib/puppet/facts
* fact_cache_time - fact cache duration. Defaults to 300

##Usage

You should now be able to use all your facter facts in discovery and fact reporting.

```
%mco rpc rpcutil get_fact fact=osfamily
Discovering hosts using the mc method for 2 second(s) .... 2

 * [ ============================================================> ] 2 / 2

node1.your.com

    Fact: osfamily
   Value: Debian

node2.your.com

    Fact: osfamily
   Value: RedHat


Summary of Value:

   RedHat = 1
   Debian = 1


Finished processing 2 / 2 hosts in 3105.79 ms
```

```
mco rpc rpcutil ping -F osfamily=RedHat
Discovering hosts using the mc method for 2 second(s) .... 1

 * [ ============================================================> ] 1 / 1


node2.your.com
   Timestamp: 1360696771



Finished processing 1 / 1 hosts in 46.86 ms
```
