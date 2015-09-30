<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
</head>

<body>
	<div id="wrap" class="content-hyphenate">

   <div id="header" class="clearfix">
     {% editable page.site_header %}
     <div class="clearer"></div>
   </div> <!-- //header -->

   {% include "Langmenu" %}

   {% include "Mainmenu" %}

   <div id="content">
     {% if tags %}
        <div class="tagged-list-header">
            <div class="header-tag-icon"></div>
            {% if tags == empty %}
                {{ "no_posts_tagged" | lc }}
            {% else %}
                {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
            {% endif %}
        </div>
     {% endif %}
     {% addbutton class="add-article" %}
            {% for article in articles %}

              <div class="blog clearfix">
         <h1><span class="gray">{{ article.created_at | format_date:"short" }}</span> <a href="{{ article.url }}">{{ article.title }}</a></h1>
                {{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more" | lc }}</a> <a href="{{ article.url }}#comments">({{"comments_for_count" |lc }}: {{article.comments_count}})</a>
         </div>
            {% endfor %}

   </div>

   <div id="bottomgif" style="text-align: center;">
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
