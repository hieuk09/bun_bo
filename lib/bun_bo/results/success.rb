class BunBo
  class Success
    def initialize(path)
      @path = path
    end

    def success?
      true
    end

    def message
      "#{path} is created successfully."
    end

    private

    attr_reader :path
  end
end
