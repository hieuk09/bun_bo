require "bun_bo"

RSpec.describe BunBo do
  before do
    @input = "spec/fixtures/example.rb"
    @output = "spec/fixtures/example_spec.rb"
  end

  describe "#run" do
    it "should create a spec file" do
      BunBo.new.run(@input)
      expect(File.exist?(@output)).to be(true)
      File.delete(@output)
    end

    it "should not create if path file does not exist" do
      expect{ BunBo.new.run('path/error.rb')}.to output(/File does not exists/).to_stdout
    end
  end
end
