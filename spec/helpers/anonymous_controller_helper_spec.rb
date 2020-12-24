require 'spec_helper.rb'

class ApplicationController < ActionController::Base

  append_after_action :add_gosquared_script, :if => :html_response?

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

    document.addEventListener('page:load', track());

    document.addEventListener('turbolinks:load', function(){
      track();
      });

    document.addEventListener('turbolinks:render', function() {
        _gs('chat', 'reattach')
        })
    })();

  </script>" + "\n </head>"
  )
  end

  def html_response?
    if response.respond_to?(:media_type)
      response.media_type == 'text/html'
    else
      response.content_type == 'text/html'
    end
  end

end
