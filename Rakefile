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
    iv = "<%= iv %>"
    server = "<%= server %>"
    script = CoffeeScript.compile(ERB.new(template, 0).result(binding))
    script = script.gsub("\n", '')
      .gsub("  ", ' ')
      .gsub("  ", ' ')
      .gsub("  ", ' ')
      .gsub("  ", ' ')
    #TODO : Here we should use the next line with the right parameters.
    #script = Uglifier.compile(script)
    File.open(Pousse::TEMPLATE_MIN, 'w') { |file| file.write(script) }
  end

end
