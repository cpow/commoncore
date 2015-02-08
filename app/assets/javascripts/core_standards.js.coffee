populate_core_standards = (data) ->
  standard_ul = $("ul#core_standard")
  for object in data
    do (object) ->
      standard_ul.append("<li style='padding:2px;'><input class='core-standard-list-item' style='padding-top:0;margin:0;' id='#{object.dot_notation}' name='lesson_plan[core_standard_ids][]' type='checkbox' value='#{object.id}'> <a  href='#' id='#{object.dot_notation}' data-statement='#{object.statement}' class='dot_notation' > #{object.dot_notation}</a></li>")
  standard_ul.slideDown()
  toggle_modal_listener()
  checkbox_listener()

checkbox_listener = (e) ->
  $(".core-standard-list-item:checkbox").change (e) ->
    selected_ul = $("ul#selected-core-standards")
    if $(this).is(":checked")
      selected_ul.append("<li id=#{this.value}>#{this.id}</li>")
    else
      id = this.value
      $("li##{id}").hide()

toggle_modal_listener = (data) ->
 $(".dot_notation").click ->
  $("#my_modal .modal-body").html("<h3>#{$(@).attr("id")}</h3><p>#{$(@).data("statement")}</p>")
  $(@).addClass('highlight')
  $("#my_modal").modal('toggle')

$ ->

  $(".delete-standard").click (e) ->
    e.preventDefault()
    idToRemove = this.id
    lessonPlanId = this.dataset.lesson_plan_id
    $("li##{idToRemove}").fadeOut("fast")
    $.ajax '/api/remove_core_standard_from_lesson_plans',
      type: 'POST',
      dataType: "json"
      data: {
        id: idToRemove
        lesson_plan_id: lessonPlanId
      }
      success: (data) ->
    

  $("ul#subject").hide()
  $("ul#core_standard").hide()

  $(".grade").click (e) ->
    e.preventDefault()
    $(@).addClass("selected")
    $(@).addClass('highlight')
    $("ul#subject").slideDown()

  $(".subject").click (e) ->
    e.preventDefault()
    $(@).addClass('highlight')
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
