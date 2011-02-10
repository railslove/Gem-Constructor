$:.unshift(File.expand_path("../", __FILE__))

# Dependencies
require "erubis"
require "fileutils"

# Files
require "gem_constructor/version"

module GemConstructor
  module_function

  def construct(lib_name)
    @lib_name = lib_name

    run_bundler
    construct_rake_file
    construct_readme
    construct_specs
  end

  public :construct

  def run_bundler
    system("bundle gem #{@lib_name}")
  end

  def construct_rake_file
    File.open("#{@lib_name}/RakeFile", "w") do |file|
      file.write(template("rake_file"))
    end
  end

  def construct_readme
    File.open("#{@lib_name}/README.md", "w") do |file|
      file.write(erubis("readme"))
    end
  end

  def construct_specs
    # Directories
    FileUtils.mkdir_p(spec_path + "/#{@lib_name}")

    # Fixture directory
    FileUtils.mkdir_p(spec_path + "/fixtures")

    # Spec helper
    File.open("#{spec_path}/spec_helper.rb", "w") do |file|
      file.write(erubis("spec_helper"))
    end

    # .rspec
    File.open("#{@lib_name}/.rspec", "w") do |file|
      file.write("--color\n")
      file.write("--profile")
    end
  end

  def spec_path
    File.join(@lib_name, "spec")
  end

  def erubis(template_name)
    Erubis::Eruby.new(template(template_name)).result(binding())
  end

  def template(name)
    File.read(File.expand_path("../", __FILE__) + "/gem_constructor/templates/#{name}.erb")
  end
end