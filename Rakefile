require "bundler/gem_tasks"

namespace :pousse do

  desc 'Precompile pousse.js'
  task :precompile do
    require './lib/pousse'
    require 'erb'
    require 'coffee-script'
    require 'uglifier'
    template = File.read(Pousse::TEMPLATE_SOURCE)
    token = "<%= token %>"
    server = "<%= server %>"
    script = CoffeeScript.compile(ERB.new(template, 0).result(binding))
    #script = Uglifier.compile(script)
    File.open(Pousse::TEMPLATE_MIN, 'w') { |file| file.write(script) }
  end

end
