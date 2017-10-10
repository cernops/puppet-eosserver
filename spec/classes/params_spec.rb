# Copy this file into code/spec/classes/init_spec.rb
#
# This example includes a basic test to check that
# eosserver::init compiles.
#
# See:
# * http://rspec-puppet.com/tutorial/
# * http://rspec-puppet.com/matchers/
# * https://github.com/mcanevet/rspec-puppet-facts
# for learning RSpec Puppet.

require 'spec_helper'

describe 'eosserver::params', :type => :class do
  let(:hiera_config) { 'spec/hiera.yaml' }
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      it { is_expected.to compile.with_all_deps }
    end
  end
end
