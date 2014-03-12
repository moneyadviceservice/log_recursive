require 'spec_helper'

describe LogRecursive::Config do
  describe :known_gems do
    subject do
      described_class.new(Pathname.new(Dir.pwd).join('spec','fixtures','fake_git_repo'))
    end

    it 'returns hash of gems and location' do
      subject.known_gems.should == {"log_recursive" => "../../.."}
    end
  end

  describe :initialize do
    context 'when .logr config is not found' do
      subject do
        described_class.new(Dir.tmpdir())
      end

      it 'raises an exception' do
        expect{ subject }.to raise_error
      end
    end
  end
end
