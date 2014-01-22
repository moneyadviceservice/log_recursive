require 'spec_helper'

describe LogRecursive::Logs do
  describe :logs do
    let(:changes) do
      LogRecursive::ChangeList.new("1ec977324701ad31e4b837c67df4afc8d2d3ce67..355f7b41259d9225c943d1ac3222c6b904dc8e51").known_changes
    end

    let(:logs) do
      Dir.chdir("spec/fixtures/fake_git_repo") do
        described_class.new(changes).logs
      end
    end

    it 'stores names' do
      logs.last[:name].should == "log_recursive"
    end

    it 'stores ref_range' do
      logs.last[:ref_range].should == "v0.0.1.2..v0.0.1.3"
    end

    it 'stores the directory' do
      logs.last[:directory].should == "../../.."
    end

    it 'stores the log' do
      logs.last[:log].should == "* 4225aa8 - (2013-10-22) Remove commander dependency, as it's not used <Gareth Visagie>"
    end
  end
end
