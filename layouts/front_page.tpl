<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
</head>

<body>

	<div id="wrap" class="content-hyphenate">

   <div id="header" class="clearfix">
     {% editable page.site_header %}
     <div class="clearer"></div>
   </div> <!-- //header -->

   {% include "Langmenu" %}

   {% include "Mainmenu" %}

   <div id="content" data-search-indexing-allowed="true">
     {% content %}
            <div class="clearer"></div>
   </div>


   <div id="footer" class="clearfix">
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
    <div class="left" style="margin-top:10px;">{% include "Search" %}</div>
    <div class="right" style="font-size: 11px; margin-top:10px;" id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
    <div class="clearer"></div>


  </div> <!-- //wrap -->
  {% include "JS" %}
</body>
</html>
