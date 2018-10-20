class BunBo
  class FileNotFound < StandardError
    def message
      "File does not exists"
    end
  end
end
