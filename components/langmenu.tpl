{% if editmode %}
    <ul id="langmenu">
        {% for language in site.languages %}
             <li><a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a></li>
             <li>/</li>
        {% endfor %}
        <li>{%languageadd%}</li>
    </ul>
{% else %}
    {% if site.has_many_languages? %}
        <ul id="langmenu">
            {% for language in site.languages %}
                 <li><a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a></li>
                 {% if forloop.last == false %}<li>/</li>{% endif %}
            {% endfor %}
        </ul>
    {% endif %}
{% endif %}

