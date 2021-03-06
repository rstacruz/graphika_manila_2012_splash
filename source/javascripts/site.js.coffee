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


# Call for entries toggle
$('.call-for-entries, .entries-info .close').click ->
  if $('body').is('.entries-active')
    $('body').removeClass 'entries-active'
    document.location.hash = ''
  else
    $('body').addClass 'entries-active'
    document.location.hash = '#call-for-entries'

# Loading thingie
$('body').removeClass 'loading'

# Responsivity
$(window).resize onResize = ->
  $('body').toggleClass 'short', ($(window).height() < 550)

  ratio = 16/10
  $bg = $('.background')
  $img = $bg.find('img')

  d =
    width: $bg.width()
    height: $bg.height()

  if d.width / d.height > ratio
    $img.css width: d.width, height: d.width / ratio
  else
    $img.css width: d.height * ratio, height: d.height

onResize()

# Hash
if window.location.hash is '#call-for-entries'
  $('body').addClass 'entries-active'
