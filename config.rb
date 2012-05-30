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
end

activate :automatic_image_sizes
