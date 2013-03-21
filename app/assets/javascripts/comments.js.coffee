# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
validate = ->
  errors_div = $("#new_comment_errors")
  content =
    element: $("#comment_content")
    name: "Content"
    validations:
      presence: true
  elements = [content]
  new $.Validations(elements, errors_div).validate() 

$ ->
  $("#new_comment").on 'submit', ->
    validate()
