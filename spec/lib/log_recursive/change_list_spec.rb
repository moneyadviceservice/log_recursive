require 'spec_helper'

describe LogRecursive::ChangeList do
  describe :changes do
    subject do
      described_class.new("1ec977324701ad31e4b837c67df4afc8d2d3ce67..9fc19dae2aa27ba61db4a33e6dea8d58c59ed150")
    end

    it 'returns nested hash { name: { direction: version, direction: version }' do
      Dir.chdir("spec/fixtures/fake_git_repo") do
        subject.changes.should == {"log_recursive"=>{"-"=>"v0.0.1.2", "+"=>"v0.0.1.3"}}
      end
    end
  end

  describe :known_changes do
    subject do
      described_class.new("1ec977324701ad31e4b837c67df4afc8d2d3ce67..355f7b41259d9225c943d1ac3222c6b904dc8e51")
    end

    it 'returns nested hash { name: { direction: version, direction: version }' do
      Dir.chdir("spec/fixtures/fake_git_repo") do
        subject.known_changes.should == {"fake_git_repo"=>{"-"=>"1ec977324701ad31e4b837c67df4afc8d2d3ce67", "+"=>"355f7b41259d9225c943d1ac3222c6b904dc8e51"}, "log_recursive"=>{"-"=>"v0.0.1.2", "+"=>"v0.0.1.3"}}
      end
    end
  end
end
