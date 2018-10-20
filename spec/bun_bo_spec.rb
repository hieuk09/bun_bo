require "bun_bo"

RSpec.describe BunBo do
  describe "#run" do
    let(:input) { "spec/fixtures/example.rb" }
    let(:output) { "spec/fixtures/example_spec.rb" }
    let(:bun_bo) { described_class.new }

    it "should create a spec file" do
      expect {
        bun_bo.run(input)
      }.to change { File.exist?(output) }.from(false).to(true)

      File.delete(output)
    end

    it "should not create if path file does not exist" do
      expect {
        bun_bo.run('path/error.rb')
      }.to raise_error(BunBo::FileNotFound)
    end
  end
end
