$j = jQuery.noConflict();

jQuery(document).ready(function() {
  jQuery("#tab-control .page .part p").hide();
  jQuery("#tab-control .page .part p select").val("TinyMce");
  jQuery("#tab-control .page .part textarea").each(function() {
    tinyMCE.execCommand('mceAddControl', false, this.id);
  });
  jQuery(".content #snippet_content").each(function() {
    tinyMCE.execCommand('mceAddControl', false, this.id);
  });
  jQuery("#show-bucket").hide();
});

assetMethods = {
  browserHook: function(field_name, url, type, win) {
    tinyMCE.activeEditor.windowManager.open({
      file:           "/admin/images",
      title:          "Image Browser",
      width:          520,
      height:         464,
      resizable:      "yes",
      inline:         "yes",
      close_previous: "no"
    }, {
      window: win,
      input:  field_name
    });
  }
}
