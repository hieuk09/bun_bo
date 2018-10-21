RSpec.describe BunBo::ContentGenerator do
  describe '#generate' do
    let(:root_path) { Pathname.new('spec/fixtures') }
    let(:generator) { described_class.new(root_path) }
    subject { generator.generate }

    context 'when rails_helper exists' do
      let(:helper_path) { root_path.join('spec', 'rails_helper') }

      before do
        File.write(helper_path, '')
      end

      after do
        File.delete(helper_path)
      end

      it { is_expected.to eq "require 'rails_helper'" }
    end

    context 'when spec_helper exists' do
      let(:helper_path) { root_path.join('spec', 'spec_helper') }

      before do
        File.write(helper_path, '')
      end

      after do
        File.delete(helper_path)
      end

      it { is_expected.to eq "require 'spec_helper'" }
    end

    context 'otherwise' do
      it { is_expected.to eq '' }
    end
  end
end
