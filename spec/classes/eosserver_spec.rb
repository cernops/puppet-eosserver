require 'spec_helper'

describe 'eosserver' do
  let(:hiera_config) { 'spec/hiera.yaml' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('eosserver::repo') }
      it { is_expected.to contain_class('eosserver::environment') }
      it { is_expected.to contain_class('eosserver::install') }

      describe 'eosserver::repo' do
        it {
          is_expected.to contain_yumrepo('xroot-stable').with(
            baseurl: "http://xrootd.cern.ch/sw/repos/stable/slc/#{facts[:operatingsystemmajrelease]}/\$basearch/"
          )
        }
        it {
          is_expected.to contain_yumrepo('eos').with(
            baseurl: "http://storage-ci.web.cern.ch/storage-ci/eos/citrine/tag/el-#{facts[:operatingsystemmajrelease]}/\$basearch/"
          )
        }
        it {
          is_expected.to contain_yumrepo('eos-deps').with(
            baseurl: "http://storage-ci.web.cern.ch/storage-ci/eos/citrine-depend/el-#{facts[:operatingsystemmajrelease]}/\$basearch/"
          )
        }
        it {
          is_expected.to contain_yumrepo('eos-quarkdb').with(
            baseurl: "http://storage-ci.web.cern.ch/storage-ci/quarkdb/tag/el#{facts[:operatingsystemmajrelease]}/\$basearch/"
          )
        }
        it {
          is_expected.to contain_yumrepo('eos-dev').with(
            baseurl: "http://storage-ci.web.cern.ch/storage-ci/eos/citrine/commit/el-#{facts[:operatingsystemmajrelease]}/\$basearch/",
            enabled: false
          )
        }
      end

      describe 'eosserver::environment' do
        it { is_expected.to contain_file('/etc/sysconfig/eos_env') }
      end

      context 'with quarkdb and debuginfos' do
        let(:params) do
          {
            ensure: 'present',
            quarkdb_ensure: 'present',
            debuginfo_ensure: 'present'
          }
        end

        it { is_expected.to contain_package('quarkdb').with_ensure_present }
        it { is_expected.to contain_package('quarkdb-debuginfo').with_ensure_present }
      end
    end
  end
end
