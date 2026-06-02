{% if products %}
    {% set columns = settings.grid_columns %}
        {% if has_filters_available %}
            <div class="category-controls">
                <a href="#" class="js-modal-open js-fullscreen-modal-open filter-link" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters">
                    {% include "snipplets/svg/filter.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-invert ml-1"} %}
                </a>
                {% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_mobile_full_screen: true} %}
                    {% block modal_head %}
                        <div class="h1">{{'Filtros' | translate }}</div>
                    {% endblock %}
                    {% block modal_body %}
                        {{ component(
                            'sort-by',{
                            label: true,
                            sort_by_classes: {
                                select_label: "label-title mb-4 d-block",
                                select_group: "mb-0",
                                select: "mb-3",
                                select_icon: "form-select-icon mr-3",
                            },
                            select_custom_icon: include("snipplets/svg/chevron-down.tpl", {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"}),
                            }) 
                        }}
                        {% if filter_categories is not empty %}
                            {% snipplet "grid/categories.tpl" %}
                        {% endif %}
                        {% if product_filters is not empty %}
                            {% snipplet "grid/filters.tpl" %}
                        {% endif %}
                        <div class="js-filters-overlay filters-overlay" style="display: none;">
                            <div class="filters-updating-message">
                                <h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
                                <h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
                            </div>
                        </div>
                    {% endblock %}
                {% endembed %}
            </div>
        {% endif %}
{% endif %}
{% if has_applied_filters %}
    <div class="row">
        {% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
    </div>
{% endif %}