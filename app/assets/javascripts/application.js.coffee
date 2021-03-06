#= require jquery
#= require jquery_ujs
#= require lodash
#= require bootstrap-sprockets
#= require moment/min/moment-with-locales
#= require angular
#= require angular-animate
#= require angular-sanitize
#= require ng-infinite-scroller-origin
#= require chartjs
#= require jquery-easing-original/jquery.easing
#= require clamp.min
#= require vue.min

#= require ./application_common/old/init
#= require_tree ./application_common/old/directives
#= require_tree ./application_common/old/filters
#= require_tree ./application_common/old/services
#= require_tree ./application_common/old/controllers

#= require ./application_common/base/init
#= require_tree ./application_common/components

#= require ./application/base/bootstrap

$ ->
  Vue.component("ann-flash", Ann.Components.Flash)
  Vue.component("ann-season-selector", Ann.Components.AnnSeasonSelector)
  Vue.component("ann-work-friends", Ann.Components.AnnWorkFriends)

  new Vue
    el: "#ann"
