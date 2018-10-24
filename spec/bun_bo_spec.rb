require "bun_bo"

RSpec.describe BunBo do
  describe "#run" do
    let(:bun_bo) { described_class.new }

    context 'when input file does not exist' do
      let(:input) { 'path/error.rb' }

      it "returns error" do
        result = bun_bo.run(input)
        expect(result).to be_a(BunBo::FileNotFound)
      end
    end

    context 'when input file exists and spec file exists' do
      let(:input) { "spec/fixtures/example.rb" }
      let(:output) { "spec/fixtures/example_spec.rb" }

      before do
        File.write(output, '')
      end

      after do
        File.delete(output)
      end

      it "returns error" do
        result = bun_bo.run(input)
        expect(result).to be_a(BunBo::FileExisted)
      end
    end

    context 'when input file exists and spec file does not exist' do
      let(:input) { "spec/fixtures/example.rb" }
      let(:output) { "spec/fixtures/example_spec.rb" }

      it "creates a spec file" do
        expect {
          result = bun_bo.run(input)
          expect(result).to be_a(BunBo::Success)
        }.to change { File.exist?(output) }.from(false).to(true)

        File.delete(output)
      end
    end
  end
end
