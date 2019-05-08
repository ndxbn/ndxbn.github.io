---
---

## Basic Usage

```
{% raw %}
{% octicon mark-github %}
{% octicon logo-github %}
{% endraw %}
```

will output: 

```html
{% octicon mark-github %}
{% octicon logo-github %}
```

and render:

{% octicon mark-github %}
{% octicon logo-github %}

## with attributes

[primer/octicons example](https://github.com/primer/octicons/tree/5c6867910915492dccd4449fd5249b48f7087638/lib/octicons_jekyll#install)

```
{% raw %}
{% octicon alert height:32 class:"right left" aria-label:hi %}
{% endraw %}
```

will output: 

```html
{% octicon alert height:32 class:"right left" aria-label:hi %}
```

and render:

{% octicon alert height:32 class:"right left" aria-label:hi %}
