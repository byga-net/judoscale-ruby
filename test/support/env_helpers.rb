# frozen_string_literal: true

module EnvHelpers
  # Override ENV config for a single spec
  # Example:
  #   use_env "RAILS_ENV" => "production" do
  #     ...
  #   end
  def use_env(config, &example)
    original_env = {}

    config.each do |key, val|
      original_env[key] = ENV[key]
      ENV[key] = val
    end

    example.call
  ensure
    config.each do |key, val|
      ENV[key] = original_env[key]
    end
  end
end

Judoscale::Test.include EnvHelpers
