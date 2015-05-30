require 'asciidoctor'
require 'tilt'

guard 'shell' do
  watch(%r{index.adoc$}) { |m|
    Asciidoctor.convert_file(m[0], :in_place => true,
      :template_dirs => ['asciidoctor-reveal.js/templates/slim'],
      :attributes => {'source-highlighter' => 'highlightjs'}
      )
  }
#  watch(%r{index.adoc$}) { |m|
#    Asciidoctor.convert_file(m[0], :in_place => true, :safe => "safe")
#  }
end

guard 'sass', :input => 'theme/source', :output => 'theme'

guard 'livereload' do
  watch(%r{^.+\.(css|js|html)$})
end
