{% set list_data_store = template == 'category' ? 'category-grid-' ~ category.id : 'search-grid' %}
{% set noFilterResult = "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." %}
{% set appliedFiltersOrCategoryResult =  has_applied_filters or template == 'category' %}

{% if products %}
    <div class="js-product-table row" data-store="{{ list_data_store }}">
        {% include 'snipplets/product_grid.tpl' %}
    </div>
	{% include 'snipplets/grid/pagination.tpl' with {'pages': pages, 'infinite_scroll': true } %}
{% else %}
    {% set tag = appliedFiltersOrCategoryResult? 'p' : 'h2' %}
    <{{ tag }} class="{% if appliedFiltersOrCategoryResult %}mt-4 font-weight-bold{% else %}text-center h-font-body{% endif %}">
        {{ appliedFiltersOrCategoryResult ? (noFilterResult| translate): ("No hubo resultados para tu búsqueda" | translate) }}
    </{{ tag }}>
{% endif %}
