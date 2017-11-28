require_relative "property_config.rb"

class Injector
  module Filter
    extend ActiveSupport::Concern
    included do
      append_after_action :add_gosquared_script, :if => :html_response?

      CLOSING_HEAD_TAG = %r{</head>}
      CLOSING_BODY_TAG = %r{</body>}

      def add_gosquared_script
        response.body = response.body.gsub(CLOSING_HEAD_TAG, "<script>

          (function() {
            if (window._gs) return;
              !function(g,s,q,r,d){r=g[r]=g[r]||function(){(r.q=r.q||[]).push(
                arguments)};d=s.createElement(q);q=s.getElementsByTagName(q)[0];
        d.src='//d1l6p2sc9645hc.cloudfront.net/tracker.js';q.parentNode.
        insertBefore(d,q)}(window,document,'script','_gs');
        _gs('#{GosquaredRails.configure.site_token}', false);
        #{GosquaredRails.configure.config_options}


        function track() {
          _gs('track');
        }
        $(document).on('page:load', track);
        $(document).on('turbolinks:load', track);

        $(document)
        .on('turbolinks:before-render', function(event){
          var chat = $('[id^=\"gs_\"]');
          if (chat.length) {
            chat
            .detach()
            .appendTo(event.originalEvent.data.newBody);
          }
          })
        .on('turbolinks:render', function() {
          try {
            window.dispatchEvent(new Event('resize'));
            } catch (e) {}
            })
})();

</script>" + "\n </head>"
)
end

def add_gosquared_identify_method(current_user)
  puts "#{self.class}"
  if current_user
    begin
      gosquared_user_properties
    rescue NameError
      STDERR.puts "ERROR: The #gosquared_user_properties method must be added to the respective controller, please see docs"
    end
    populate_script
  end
end

private

def populate_script(property_config=PropertyConfig.new)
 unless GosquaredRails.configure.custom_properties.nil?
  property_config.sort_property_fields(GosquaredRails.configure.custom_properties)
  response.body = response.body.gsub(CLOSING_BODY_TAG, "<script>
    _gs('identify',
      #{property_config.gosquared_standard_properties}
      #{property_config.gosquared_custom_properties}
      });
  </script>" + "\n </body>"
  )
end
end

def html_response?
  response.content_type == "text/html"
end

end

end

end
