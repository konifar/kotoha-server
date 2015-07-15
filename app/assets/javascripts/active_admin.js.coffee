#= require active_admin/base
#= require chosen-jquery
#= require jquery.tagsinput
#= require jquery-ui
#= require autocomplete-rails

jQuery ->
  $('select').chosen()

  $('.tag-input').tagsInput
    'autocomplete_url': '/api/tags.json',
    'autocomplete':{
      selectFirst: true,
      autoFill: true,
      source: (request, response)->
        $.ajax
          url: "/api/tags.json",
          dataType: "json",
          data: {
            q: request.term
          },
          success: (tags)->
            response $.map(tags, (tag)->
              {
                label: "#{tag.name}(#{tag.taggings_count})",
                value: tag.name
              }
            )
    },
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

