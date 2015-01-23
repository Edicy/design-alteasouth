<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
</head>

<body>
	
	<div id="wrap" class="content-hyphenate">
   
   <div id="header" class="clearfix">
     {% editable site.header %}
     <div class="clearer"></div>
   </div> <!-- //header -->
   
   {% include "Langmenu" %}
   
   {% include "Mainmenu" %}
   
   <div id="content">
           
        
            <div class="blog clearfix">
       <h1><span class="gray">{{ article.created_at | format_date:"short" }}</span> {% editable article.title plain="true" %}</h1>
              <div class="excerpt" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
              <div data-search-indexing-allowed="true">{% editable article.body %}</div>
              <div class="clearer"></div>
              {% if editmode %}
                <div class="article-tags">
                    <div class="article-tag-icon"></div>
                    {% editable article.tags %}
                </div>
              {% else %}
                {% unless article.tags == empty %}
                    <div class="cfx article-tags">
                        <div class="article-tag-icon"></div>
                        {% for tag in article.tags %}
                            <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                        {% endfor %}
                    </div>
                {% endunless %}
            {% endif %}
              
              
              
              
              <a name="comments"></a>
       </div>
            {% unless article.new_record? %}<h1>{{ "comments_for_count"|lc}}: <span class="gray edy-site-blog-comments-count">{{article.comments_count}}</span> </h1>{% endunless %}
            {% for comment in article.comments %}
              
              <div class="comment edy-site-blog-comment">
                {{ comment.body_html }}  <b><span class="gray">{{ comment.created_at | format_date:"short" }}</span> <span class="blue">{{ comment.author }}</span></b> {% removebutton %}
              </div>       
            {% endfor %}
     
   </div>
   
          <div class="comment-form">
     {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
       <div>
           <h1>{{"add_a_comment"|lc}}</h1>
           
           <table>
             <tr>
               <td style="text-align: right;">{{ "name"|lc }}</td>
               <td><input type="text" class="textbox" name="comment[author]" value="{{ comment.author }}" /></td>
             </tr>
             <tr>
               <td style="text-align: right;">{{"email"|lc}}</td>
               <td><input type="text" class="textbox" name="comment[author_email]" value="{{comment.author_email}}" /></td>
             </tr>
             <tr>
               <td style="text-align: right;">{{ "comment"|lc}}</td>
               <td><textarea cols="7" rows="4" class="textarea" name="comment[body]">{{ comment.body }}</textarea></td>
             </tr>
             <tr>
               <td></td>
               <td><input type="submit" value="{{ "submit"|lc}}" class="submit" /></td>
             </tr>
           </table>
               
       </div>
      {% endcommentform %}
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