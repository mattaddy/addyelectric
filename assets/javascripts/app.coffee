$ ->

  $('#slider').nivoSlider
    effect: 'sliceDownRight'
    pauseTime: 6000
    controlNav: false
    nextText: ''
    prevText: ''


  $('nav li ul').hide().removeClass('fallback')

  $('nav li').hover(
    -> $('ul', this).stop().slideDown(100);
    -> $('ul', this).stop().slideUp(100);
  )

  $('.dropdown-link').click (e) -> e.preventDefault()

  panels = $('.accordion > dd').hide();
  $('.accordion > dt > a').click (e) ->
    e.preventDefault()
    $this = $(this)
    $target = $this.parent().next()
    if(!$target.hasClass('active'))
       panels.removeClass('active').slideUp('fast')
       $target.addClass('active').slideDown('fast')
