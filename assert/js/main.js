(function() {
  var $confirm;

  $confirm = null;

  $(function() {
    var $createDestroy, $window, sectionTop;
    $window = $(window);
    sectionTop = $(".top").outerHeight() + 20;
    hljs.initHighlightingOnLoad();
    $("input[type=\"checkbox\"], input[type=\"radio\"]").not("[data-switch-no-init]").bootstrapSwitch();
  });

}).call(this);
