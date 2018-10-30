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

    private

    attr_reader :results
  end
end
