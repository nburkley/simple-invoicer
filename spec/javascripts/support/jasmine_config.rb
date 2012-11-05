module Jasmine
  class Config

    # Add your overrides or custom config code here
    def src_files
      files = Rails.application.assets["application"].dependencies.map do |asset|
        "assets/" + asset.logical_path
      end
      files << "spec/javascripts/support/jasmine-jquery-1.3.1.js"
      files << "spec/javascripts/support/sinon-1.1.1.js"
      files << "spec/javascripts/support/jasmine-sinon.js"
    end
  end
end


# Note - this is necessary for rspec2, which has removed the backtrace
module Jasmine
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end
end
