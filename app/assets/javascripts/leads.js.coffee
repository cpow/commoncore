validate = ->
  errors_div = $("#new_lead_errors")
  name =
    element: $("#lead_name")
    name: "Name"
    validations:
      presence: true
  email =
    element: $("#lead_email")
    name: "Email"
    validations:
      presence: true
      email: true
  elements = [email, name]
  new $.Validations(elements, errors_div).validate()

$ ->
  $("#new_lead").on 'submit', ->
    validate()
