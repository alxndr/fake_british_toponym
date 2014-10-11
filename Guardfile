guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch("spec/spec_helper.rb")  { "spec" }
  watch("Gemfile.lock")         { "spec" }
  watch(%r{^lib/(.+)\.rb$})     { |m| specfile = "spec/#{m[1]}_spec.rb" and File.exists?(specfile) ? specfile : "spec" }
end

