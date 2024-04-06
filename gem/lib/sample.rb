# frozen_string_literal: true

require_relative "sample/version"

module Sample
  class Error < StandardError; end

  def self.hello
    "Hello"
  end
end
