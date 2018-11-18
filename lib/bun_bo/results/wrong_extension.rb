require 'bun_bo/results/base_error'

class BunBo
  class WrongExtension < BaseError
    def initialize(path)
      @path = path
    end

    def message
      "#{path} is not a correct ruby file."
    end

    private

    attr_reader :path
  end
end
