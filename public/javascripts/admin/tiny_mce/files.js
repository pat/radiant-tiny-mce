$j = jQuery.noConflict();

var assetBrowser = {
  init: function() {
    jQuery("table a").click(function() {
      assetBrowser.submit(this.href);
      return false;
    });
    
    jQuery("#choose_page").click(function() {
      assetBrowser.submit(jQuery("select").val());
    });
    jQuery("option").dblclick(function() {
      assetBrowser.submit(jQuery(this).attr("value"));
    });
  },
  
  submit: function(href) {
    var win = tinyMCEPopup.getWindowArg("window");
    
    win.document.getElementById(tinyMCEPopup.getWindowArg("input")).value = href;
    
    tinyMCEPopup.close();
  }
};

tinyMCEPopup.onInit.add(assetBrowser.init, assetBrowser);
