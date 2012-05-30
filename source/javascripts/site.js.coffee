#= require jquery.countdown

$('[data-countdown_until]').each ->
  $this = $(this)
  sUntil = $this.attr('data-countdown_until')

  if sUntil
    $this.countdown
      until: new Date(sUntil)
      update: (segment, text) ->
        $el = $this.find(".#{segment}.box")
        $strong = $el.find('strong')

        $el.queue (next) ->
          # Move the old one out...
          $strong.removeClass('enter').addClass('exit')
          setTimeout (-> $strong.remove()), 500

          # And slide a new one in.
          $new = $('<strong>')
            .addClass('enter')
            .appendTo($el)
            .text(text)
          setTimeout (-> $new.removeClass('enter')), 0

          setTimeout next, 600


$('.call-for-entries, .entries-info .close').click ->
  $('body').toggleClass 'entries-active'
