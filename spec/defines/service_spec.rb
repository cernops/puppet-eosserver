require 'spec_helper'
describe 'eosserver::service' do
  let(:hiera_config) { 'spec/hiera.yaml' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:title) { 'testinst' }

      let(:params) do
        {
          service_ensure: 'running',
          service_manage: false
        }
      end

      context 'with defaults ensure testinst is running' do
        it { expect(subject).to compile.with_all_deps }
        it {
          expect(subject).to contain_service('testinst').with(
            ensure: 'running',
            enable: true
          )
        }
      end
    end
  end
end
