$j = jQuery.noConflict();

jQuery(document).ready(function() {
  jQuery("li img").each(function() {
    var img     = jQuery(this);
    var height  = parseInt(img.css("height"));
    
    if (height < 100)
      img.css("margin-top", ((100 - height)/2).toString() + "px");
  });
});

var assetBrowser = {
  init: function() {
    jQuery("li a").click(function() {
      assetBrowser.submit(this);
      return false;
    });
  },
  
  submit: function(link) {
    var win = tinyMCEPopup.getWindowArg("window");
    
    win.document.getElementById(tinyMCEPopup.getWindowArg("input")).value = link.href;
    
    if (win.ImageDialog.getImageData) win.ImageDialog.getImageData();
    if (win.ImageDialog.showPreviewImage) win.ImageDialog.showPreviewImage(URL);
    
    tinyMCEPopup.close();
  }
};

tinyMCEPopup.onInit.add(assetBrowser.init, assetBrowser);
