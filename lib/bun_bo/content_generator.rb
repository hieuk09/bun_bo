class BunBo
  class ContentGenerator
    def initialize(root_path)
      @root_path = root_path
    end

    def generate
      if root_path.join('spec', 'rails_helper.rb').exist?
        "require 'rails_helper'"
      elsif  root_path.join('spec', 'spec_helper.rb').exist?
        "require 'spec_helper'"
      else
        ''
      end
    end

    private

    attr_reader :root_path
  end
end
