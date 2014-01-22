require 'spec_helper'

describe LogRecursive::ChangeList do
  describe :changes do
    subject do
      described_class.new("1ec977324701ad31e4b837c67df4afc8d2d3ce67..9fc19dae2aa27ba61db4a33e6dea8d58c59ed150")
    end

    it 'returns nested hash { name: { direction: version, direction: version }' do
      Dir.chdir("spec/fixtures/fake_git_repo") do
        subject.changes.should == {"log_recursive"=>{"-"=>"0.0.1.2", "+"=>"0.0.1.3"}}
      end
    end
  end
end
