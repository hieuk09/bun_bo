require 'bun_bo/results/base_error'

class BunBo
  class FileNotFound < BaseError
    def message
      "File does not exists"
    end
  end
end
