$ ->
  $('.best_in_place').best_in_place()

  $('#new_contact').validate 
    rules:
      contact_first_name:
        required: true
      contact_last_name:
        required: true  
      contact_phones_attributes_0_name:
        required: true
      contact_emails_attributes_0_name:
        required: true
        email: true

  $('#new_phone').validate
    rules:
      phone_name:
        required: true

  $('#new_email').validate
    rules:
      email_name:
        required: true
        email: true

  $('#share_form').validate
    rules:
      email:
        required: true
        email: true


  $('#show-emails-form').click ->
    $(this).hide()
    $('#emails-form').removeClass('hidden')
    return

  $('#show-phones-form').click ->
    $(this).hide()
    $('#phones-form').removeClass('hidden')
    return

  $('#close-notice').click ->
    $('.notice').hide()
    return


  return


