$(document).on 'click', '.remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  if $('#type-ratings fieldset:visible').length == 0
    $('#no-type-ratings').show()
  event.preventDefault()

$(document).on 'click', '.add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  $('.selectpicker').selectpicker()
  if $('#type-ratings fieldset:visible').length == 1
    $('#no-type-ratings').hide()
  event.preventDefault()