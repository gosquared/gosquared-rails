class Injector
  module Filter
    extend ActiveSupport::Concern
    included do
      append_after_filter :add_gosquared_script, :if => :html_response?

      CLOSING_HEAD_TAG = %r{</head>}

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

       </script>" + "\n </body>"
            )
      end

      def html_response?
        response.content_type == "text/html"
      end

    end
  end

end
