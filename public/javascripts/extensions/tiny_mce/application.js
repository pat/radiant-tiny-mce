$j = jQuery.noConflict();

TabControl.addMethods({
  actualSelect: TabControl.prototype['select'],
  select: function(tab) {
    this.actualSelect(tab);
    tinyMCESetup();
  }
});

function tinyMCESetup() {
  jQuery("#tab-control .page .part p").hide();
  jQuery("#tab-control .page .part p select").val("TinyMce");
  jQuery("#tab-control .page .part textarea").each(function() {
    tinyMCE.execCommand('mceAddControl', false, this.id);
  });
  jQuery(".content #snippet_content").each(function() {
    tinyMCE.execCommand('mceAddControl', false, this.id);
  });
  jQuery("#show-bucket").hide();
}

jQuery(document).ready(tinyMCESetup);

assetMethods = {
  browserHook: function(field_name, url, type, win) {
    tinyMCE.activeEditor.windowManager.open({
      file:           "/admin/tiny_mce/" + type + "s",
      title:          (type == "image" ? "Image" : "File") + " Browser",
      width:          520,
      height:         (type == "image" ? 464 : 458),
      resizable:      "yes",
      inline:         "yes",
      close_previous: "no"
    }, {
      window: win,
      input:  field_name
    });
    return false;
  }
}
