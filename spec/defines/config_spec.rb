require 'spec_helper'
describe 'eosserver::config' do
  let(:hiera_config) { 'spec/hiera.yaml' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:title) { 'test' }

      context 'with no defaults' do
        it { is_expected.not_to compile.with_all_deps }
      end

      context 'with sensible defaults' do
        let(:params) do
          {
            package_ensure: 'present',
            config_file: '/test/config_file',
            config: {
              'testkey' => 'my value',
              'another key' => 'another value',
              'listkeys' => %w[my little poney]
            }
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/test/config_file').with_content(%r{testkey}) }
      end
    end
  end
end
