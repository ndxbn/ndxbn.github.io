---
---

{% for post in site.posts %}

- [{{ post.title }}]({{post.url}}) slug: {{post.slug}}
  {%- endfor %}
