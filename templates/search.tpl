{% set has_filters_available = has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{% paginate by 12 %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false } %}
  {% block page_header_text %}{{ "Resultados de búsqueda" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="category-body px-2 px-md-3">
  <div class="container-fluid">
    {% include "snipplets/grid/filters-controls.tpl" %}
    {% include 'snipplets/grid/products-list.tpl' %}
  </div>
</section>