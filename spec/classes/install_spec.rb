require 'spec_helper'

describe 'eosserver::install' do
  let(:hiera_config) { 'spec/hiera.yaml' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:title) { 'test' }

      context 'test instance with ensure=absent' do
        let(:params) do
          {
            package_ensure: 'absent'
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('xrootd').with_ensure_absent }
      end

      context 'test instance with defaults' do
        let(:params) do
          {
            package_ensure: 'present'
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('xrootd') }
        it { is_expected.to contain_package('xrootd-client') }
        it { is_expected.to contain_package('xrootd-libs') }
        it { is_expected.to contain_package('eos-server') }
        it { is_expected.to contain_package('eos-client') }
        # it { is_expected.to contain_package('eos-archive') }
        it { is_expected.to contain_package('eos-debuginfo').with_ensure_absent }
        it { is_expected.to contain_package('xrootd-debuginfo').with_ensure_absent }
      end

      context 'with quarkdb' do
        let(:params) do
          {
            package_ensure: 'present',
            quarkdb_ensure: 'present'
          }
        end

        it { is_expected.to contain_package('quarkdb').with_ensure_present }
      end

      context 'with debuginfo' do
        let(:params) do
          {
            package_ensure: 'present',
            debuginfo_ensure: 'present'
          }
        end

        it { is_expected.to contain_package('eos-debuginfo').with_ensure_present }
        it { is_expected.to contain_package('xrootd-debuginfo').with_ensure_present }
        it { is_expected.to contain_package('quarkdb-debuginfo').with_ensure_present }
      end
    end
  end
end
