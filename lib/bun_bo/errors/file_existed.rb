require 'bun_bo/errors/base_error'

class BunBo
  class FileExisted < BaseError
    def initialize(path)
      @path = path
    end

    def message
      "#{path} exists. No modification is applied for this file."
    end

    private

    attr_reader :path
  end
end
