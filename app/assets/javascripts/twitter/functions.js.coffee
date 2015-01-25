# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@changeColor = (element, action, boolean) ->
  unless boolean
    switch action
      when "favorite" 
        element.style.color = "orange"
      when "retweet" 
        element.style.color = "green"
  else
    element.style.color = "gray" 
