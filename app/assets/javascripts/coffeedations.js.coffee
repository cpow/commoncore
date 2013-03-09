class $.Validations

  constructor: (@validation_objects, @errors_div) ->

  validate: ->
    errors=0
    @errors_div.hide()
    this.clear_errors(@errors_div)
    error_objects = this.check_errors()
    for object in error_objects
      if object.errors.length==0
        this.unwrap_element(object.element)
      else
        errors+=1
        this.build_errors(object.errors, @errors_div, object.element)
    if errors == 0 then return true else return false

  check_errors: ->
    email_regex = /^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/
    dob_regex = /^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$/
    for validation_object in @validation_objects
      errors = []
      validation_object.errors = []
      element_value = validation_object.element.val().replace(/[- () _]/g, "")
      if validation_object.validations.checked then errors.push("#{validation_object.name} must be checked") unless validation_object.element.attr("checked") == "checked"
      if validation_object.validations.email then errors.push("#{validation_object.name} must be a valid email address") unless email_regex.test(element_value)
      if validation_object.validations.dob then errors.push("#{validation_object.name} must be a valid dob (mm/dd/yyyy)") unless dob_regex.test(element_value)
      if validation_object.validations.matches then errors.push("#{validation_object.name} doesn't match #{validation_object.validations.matches.name}") unless element_value.toLowerCase()==validation_object.validations.matches.element.toLowerCase()
      if validation_object.validations.numericality then errors.push("#{validation_object.name} must be a number") unless element_value.match(/^[0-9]+/)
      if validation_object.validations.presence then errors.push("#{validation_object.name} cannot be blank") unless element_value!=""
      if validation_object.validations.length then errors.push("#{validation_object.name} must be #{validation_object.validations.length} characters") unless element_value.length==validation_object.validations.length
      validation_object.errors = errors
      errors=[]
    return @validation_objects

  build_errors: (errors, errors_div, element) ->
    errors_div.addClass("error") unless errors_div.hasClass("error")
    for error in errors
      errors_div.append("<div class='coffeedations_error'>#{error}</div>")
      this.wrap_element(element)
    errors_div.fadeIn()

  clear_errors: (errors_div) ->
    errors_div.html("")
    errors_div.removeClass("error")

  wrap_element: (element) ->
    element.wrap("<div class='field_with_errors' />") unless element.parent().hasClass("field_with_errors")

  unwrap_element: (element) ->
    element.unwrap() if element.parent().hasClass("field_with_errors")