Template.registerHelper "debug", (optionalValue) ->
  if typeof console isnt "undefined" or typeof console.log isnt "undefined"
    console.log "Current Context"
    console.log "===================="
    console.log this
    if optionalValue
      console.log "Value"
      console.log "===================="
      console.log optionalValue
    return ""
