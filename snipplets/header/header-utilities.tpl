<div class="utilities-container">
	<div class="utilities-item">
		<a href="#" class="js-modal-open js-toggle-search utilities-link" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
			{% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"} %}
		</a>
	</div>
	{# Account link — desktop only #}
	<div class="utilities-item d-none d-md-inline-block">
		{% if not customer %}
			<a href="{{ store.customer_login_url }}" class="utilities-link" aria-label="{{ 'Ingresar' | translate }}">
				{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"} %}
			</a>
		{% else %}
			<a href="{{ store.customer_home_url }}" class="utilities-link" aria-label="{{ 'Mi cuenta' | translate }}">
				{% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"} %}
			</a>
		{% endif %}
	</div>
	{% if not store.is_catalog %}
		<div class="utilities-item">
			<div id="ajax-cart" class="cart-summary">
				<a {% if template != 'cart' %}href="#" class="js-modal-open js-fullscreen-modal-open js-toggle-cart position-relative" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart"{% else %}href="{{ store.cart_url }}"{% endif %}>
					{% include "snipplets/svg/shopping-bag.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"} %}
					<span class="js-cart-widget-amount js-visible-on-cart-filled cart-widget-amount" {% if cart.items_count == 0 %}style="display:none;"{% endif %}></span>
				</a>
			</div>
		</div>
	{% endif %}
	<div class="js-hamburger-menu utilities-item d-md-none">
		<a href="#" class="js-modal-open js-hamburger-open utilities-link" data-toggle="#nav-hamburger" data-modal-url="nav-fullscreen-hamburger" aria-label="{{ 'Menú' | translate }}">
			<div class="hamburger-bar-1 mt-2"></div>
			<div class="hamburger-bar-hidden"></div>
			<div class="hamburger-bar-2"></div>
		</a>
	</div>
</div>