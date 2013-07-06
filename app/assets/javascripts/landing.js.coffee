# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

class Scroller
  constructor: (@icons_top,
    @icons_bottom,
    @icons_top_height,
    @icons_bottom_height,
    @top_icons_scrolled,
    @bottom_icons_scrolled) ->

  check_scroll: =>
    $(window).on 'scroll', =>
      unless @top_icons_scrolled
        if $(window).scrollTop() >= @icons_top_height * 2.0
          @slow_fade(@icons_top)
          @top_icons_scrolled = true

      unless @bottom_icons_scrolled
        if $(window).scrollTop() >= @icons_bottom_height * 3.2
          @slow_fade(@icons_bottom)
          @bottom_icons_scrolled = true

  slow_fade: (element) ->
    element.css('visibility','visible').hide().fadeIn(600)

$ ->
  $(document).on 'ready', ->
    scroller = new Scroller($('.icons_top'), $('.icons_bottom'), $('.icons_top').height(), $('.icons_bottom').height(), false, false)
    #scroller.check_scroll()
    scroller.slow_fade($('ul.buttons'))
