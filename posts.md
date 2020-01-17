---
---

{% for post in site.posts %}
- [{{ post.slug }}]({{post.url}})
{%- endfor %}
