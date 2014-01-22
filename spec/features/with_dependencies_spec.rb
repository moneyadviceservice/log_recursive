require 'spec_helper'

describe 'Output' do
  context "When there are dependencies" do
    let(:lines){ `cd spec/fixtures/fake_git_repo && ../../../bin/logr 1ec977324701ad31e4b837c67df4afc8d2d3ce67..9fc19dae2aa27ba61db4a33e6dea8d58c59ed150 && cd -`.split("\n") }

    it 'outputs multiple project banners' do
      lines.select{|l| l == "="*80}.size.should == 2
    end
  end
end
