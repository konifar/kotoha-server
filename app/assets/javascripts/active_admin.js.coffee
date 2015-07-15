#= require active_admin/base
#= require chosen-jquery
#= require jquery.tagsinput


jQuery ->
  $('select').chosen()

  $('.tag-input').tagsInput
   # 'autocomplete_url': url_to_autocomplete_api,
   # 'autocomplete': { option: value, option: value},
    'height':'100px',
    'width':'300px',
    'interactive':true,
    'defaultText':'Add a tag',
    # 'onAddTag':callback_function,
    # 'onRemoveTag':callback_function,
    # 'onChange' : callback_function,
    'removeWithBackspace' : true,
    'minChars' : 0,
    'maxChars' : 60
    'placeholderColor' : '#666666'

