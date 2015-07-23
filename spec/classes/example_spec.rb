require 'spec_helper'

describe 'x2go' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "x2go class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('x2go::params') }
          it { is_expected.to contain_class('x2go::install').that_comes_before('x2go::config') }
          it { is_expected.to contain_class('x2go::config') }
          it { is_expected.to contain_class('x2go::service').that_subscribes_to('x2go::config') }

          it { is_expected.to contain_service('x2go') }
          it { is_expected.to contain_package('x2go').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'x2go class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('x2go') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
