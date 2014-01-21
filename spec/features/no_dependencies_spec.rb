require "spec_helper"

describe "Output" do
  context "When there are no dependencies" do
    let(:lines){ `./bin/logr 9da39d7..c3fa079`.split("\n") }

    it 'outputs project banner' do
      lines[0].should == "="*80
      lines[1].should include("log_recursive")
      lines[2].should == "-"*80
    end

    it 'outputs latest commit' do
      lines[3].should include('c3fa079')
      lines[3].should include('2014-01-21')
      lines[3].should include('Add mas development dependencies')
      lines[3].should include('Phil Lee')
    end

    it 'outputs oldest commit' do
      lines.last.should include('4225aa8')
      lines.last.should include('2013-10-22')
      lines.last.should include("Remove commander dependency, as it's not used")
      lines.last.should include('Gareth Visagie')
    end
  end
end

