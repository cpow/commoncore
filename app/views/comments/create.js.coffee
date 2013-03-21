$ ->
  $("#new_comment").bind "ajax:success", ->
    console.log("<%= @comment.content %>")
    $("#comments ul li").last().append("<%= escape_javascript(render partial: 'comments/comment', locals: {comment: @comment}) %>")
