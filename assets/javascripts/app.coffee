$ ->

  $('#slider').nivoSlider
    effect: 'sliceDownRight'
    pauseTime: 6000
    controlNav: false


  $('nav li ul').hide().removeClass('fallback')

  $('nav li').hover(
    -> $('ul', this).stop().slideDown(100);
    -> $('ul', this).stop().slideUp(100);
  )

  $('.dropdown-link').click (e) -> e.preventDefault()
