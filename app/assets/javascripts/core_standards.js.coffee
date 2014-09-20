populate_core_standards = (data) ->
  standard_ul = $("ul#core_standard")
  for object in data
    do (object) ->
      standard_ul.append("<li style='padding:2px;'><input style='padding-top:0;margin:0;' id='#{object.dot_notation}' name='core_standard_ids[]' type='checkbox' value='#{object.id}'> <a  href='#' id='#{object.dot_notation}' data-statement='#{object.statement}' class='dot_notation' > #{object.dot_notation}</a></li>")
  standard_ul.slideDown()
  toggle_modal_listener()

toggle_modal_listener = (data) ->
 $(".dot_notation").click ->
  $("#my_modal .modal-body").html("<h3>#{$(@).attr("id")}</h3><p>#{$(@).data("statement")}</p>")
  $("#my_modal").modal('toggle')

$ ->
  $("ul#subject").hide()
  $("ul#core_standard").hide()

  $(".grade").click ->
    $(@).addClass("selected")
    $("ul#subject").slideDown()

  $(".subject").click ->
    $("ul#core_standard").html("")
    $("ul#core_standard").slideUp()
    $.ajax '/core_standards/specific_core_standard',
      type: 'GET',
      dataType: "json"
      data: {
        level: $("ul#grade > li").find(".grade.selected").attr('id'),
        subject: $(@).attr('id')
      }
      success: (data) ->
        populate_core_standards(data)
