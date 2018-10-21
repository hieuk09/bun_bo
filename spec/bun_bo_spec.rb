require "bun_bo"

RSpec.describe BunBo do
  describe "#run" do
    let(:bun_bo) { described_class.new }

    context 'when input file does not exist' do
      let(:input) { 'path/error.rb' }

      it "raises error" do
        expect {
          bun_bo.run(input)
        }.to raise_error(BunBo::FileNotFound)
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

      it "raises error" do
        expect {
          bun_bo.run(input)
        }.to raise_error(BunBo::FileExisted)
      end
    end

    context 'when input file exists and spec file does not exist' do
      let(:input) { "spec/fixtures/example.rb" }
      let(:output) { "spec/fixtures/example_spec.rb" }

      it "creates a spec file" do
        expect {
          bun_bo.run(input)
        }.to change { File.exist?(output) }.from(false).to(true)

        File.delete(output)
      end
    end
  end
end
