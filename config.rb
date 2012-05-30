activate :automatic_image_sizes
activate :cache_buster
activate :relative_assets
compass_config { |config| config.output_style = :compact }

configure :build do
  activate :minify_javascript
  # require 'middleman-smusher'
  # activate :smusher
end

helpers do
  # != webfonts google: { families: [ 'PT Sans:400,700' ] }
  def webfonts(config={})
    %{<script>
    WebFontConfig = #{config.to_json};
    (function() {
      var wf = document.createElement('script');
      wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
          '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
      wf.type = 'text/javascript';
      wf.async = 'true';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(wf, s);
    })();
    </script>}.gsub(/\n\s*/, '')
  end

  # != google_analytics('UA-28347981-1')
  def google_analytics(id)
    %{<script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', #{id.to_json}]);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    </script>}.gsub(/\n\s*/, '')
  end
end

activate :automatic_image_sizes
