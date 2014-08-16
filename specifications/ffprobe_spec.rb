require_relative 'spec_helper'

describe FFProbe do
  describe '.version' do
    it 'should return the version constant' do
      expect(FFProbe.version).to eq FFProbe::Version
    end
  end

  describe '.path' do
    context 'when not explicitly set' do
      it 'should traverse the PATH environment variable' do
        string = double :string, split: []
        expect(ENV).to receive(:[]).with('PATH').and_return string
        expect(string).to receive :split

        subject.path
      end
    end

    context 'when explicitly set' do
      before do
        subject.path = '/some/obscure/path'
      end

      it 'should return the path' do
        expect(subject.path).to eq '/some/obscure/path'
      end
    end
  end

  describe '.probe' do
    context 'when the file is readable' do
      before { allow(File).to receive(:readable?).and_return true }

      it 'should return a container' do
        result = FFProbe.probe 'file'

        expect(result).to be_kind_of FFProbe::Container
      end

      it 'should tell the container to probe and parse the file' do
        expect_any_instance_of(FFProbe::Container).to receive :parse!

        FFProbe.probe 'file'
      end
    end

    context 'when the file is not readable' do
      it 'should raise an error' do
        allow(File).to receive(:readable?).and_return false

        expect { FFProbe.probe 'unreadable-file' }.to raise_error
      end
    end
  end
end
