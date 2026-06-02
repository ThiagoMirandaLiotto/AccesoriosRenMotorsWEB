{% set has_filters_available = has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}


{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

{% if not show_help %}

    {% if (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
        {% include 'snipplets/category-banner.tpl' %}
    {% endif %}


    {% embed "snipplets/page-header.tpl" with { breadcrumbs: false } %}
        {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
    {% endembed %}

    <section class="category-body position-relative px-2 px-md-3">
        <div class="container-fluid">
            {% include 'snipplets/grid/filters-controls.tpl' %}
            {% include 'snipplets/grid/products-list.tpl' %}
        </div>
    </section>
{% elseif show_help %}
    {# Category Placeholder #}
    {% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
