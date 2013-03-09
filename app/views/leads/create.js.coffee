$ ->
  $("#new_lead").bind "ajax:success", ->
    $(@).html("<a class='close' data-dismiss='alert'>×</a><div class='alert alert-success'>Thank you for signing up! We are working hard on the final product and we'll email you when its ready!</div>")
