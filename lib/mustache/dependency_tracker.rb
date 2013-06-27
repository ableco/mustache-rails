require 'action_view/dependency_tracker'

class Mustache
  class DependencyTracker < ActionView::DependencyTracker::ERBTracker
    private
    
    def source
      # Use standard mustache parser to generate tokens
      tokens = ::Mustache::Parser.new.compile(template.source)

      # Use custom generator to generate the compiled ruby
      ActionView::Mustache::Generator.new.compile(tokens)
    end

  end
end
