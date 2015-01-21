<ul id="mainmenu">
{% unless site.root_item.hidden? %}<li><a href="{{ site.root_item.url }}"{% if site.root_item.current? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>{% endunless %}
{% for item in site.visible_menuitems %}
<li>/</li>
<li><a href="{{ item.url }}"{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if item.selected? %} class="active"{% endif %}>{{ item.title }}</a></li>
{% endfor %}
{% if editmode %}<li class="vg-menu-btn">{% menubtn site.hidden_menuitems %}</li><li class="vg-menu-btn">{% menuadd %}</li>{% endif %}
</ul>
	{% for item in site.all_menuitems %}{% if item.selected? %}{% if editmode %}
<ul id="submenu">{% for level2 in item.visible_children %}
	{% unless forloop.first %}<li>/</li>{% endunless %}
	<li><a href="{{ level2.url }}"{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a></li>
	{% endfor %}
    <li class="vg-menu-btn">{% menubtn item.hidden_children %}</li>
<li class="vg-menu-btn">{% menuadd parent="item" %}</li>
	</ul>
{% else %}{% if item.children? %}<ul id="submenu">{% for level2 in item.all_children %}
	{% unless forloop.first %}<li>/</li>{% endunless %}
	<li><a href="{{ level2.url }}"{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a></li>
	{% endfor %}
	</ul>{% endif %}{% endif %}{% endif %}{% endfor %}

<!-- //navmenu -->