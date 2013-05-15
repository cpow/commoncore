$ ->
  $("#new_comment").bind "ajax:success", ->
    $("#comments ul").append("<%= escape_javascript(render partial: 'comments/comment', locals: {comment: @comment}) %>")
    $("#comment_content").val("")
