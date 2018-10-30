class BunBo
  class DirectoryResult
    def initialize(results)
      @results = results
    end

    def success?
      results.all?(&:success?)
    end

    def message
      results.map(&:message).join("\n")
    end
  end
end
