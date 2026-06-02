{# Common variables #}
{% set empty_placeholder = 'images/empty-placeholder.png' | static_url %}
{% set video_color = settings.primary_color | trim('#') %}
{% if template != 'product' %}
	{% set video_alt_name = product.name %}
{% else %}
	{% set video_alt_name = store.name %}
{% endif %}
{% set video_alt_text = 'Video de' | translate ~ ' ' ~ video_alt_name %}

{% if product_modal %}
	<div id="product-video-modal-{{ media.id }}" class="js-product-video-modal product-video" style="display: none;">
{% endif %}

	<div class="{% if not product_native_video %}js-video embed-responsive embed-responsive-16by9{% endif %} {% if product_video and not product_modal %}js-video-product{% endif %} visible-when-content-ready {% if product_native_video %}product-native-video-container{% endif %}">

		{% if product_modal_trigger %}
			<a id="trigger-video-modal-{{ media.id }}" href="#product-video-modal-{{ media.id }}" data-fancybox="product-gallery" class="js-play-button video-player d-block d-md-none">
				<div class="video-player-icon">{% include "snipplets/svg/play-circle.tpl" with {svg_custom_class: "icon-inline svg-icon-invert"} %}</div>
			</a>
		{% endif %}

		<a href="javascript:void(0)" {% if product_native_video %}data-video_uid="{{ media.next_video }}"{% endif %} class="{% if product_native_video %}js-play-native-button{% else %}js-play-button{% endif %} video-player {% if product_modal_trigger %}d-none d-md-block{% endif %}">
			<div class="video-player-icon">{% include "snipplets/svg/play-circle.tpl" with {svg_custom_class: "icon-inline svg-icon-invert"} %}</div>
		</a>

		{% if product_native_video %}
			<div class="js-video-native-image w-100">
				<div data-video_uid="{{ media.uid }}" class="js-external-video-iframe-container embed-responsive" data-video-color="{{ video_color }}" data-aspect-ratio="{{ media.dimensions.aspect_ratio }}%" style="display:none;">
					{{ media.render | raw }}
				</div>
				<img data-video_uid="{{ media.uid }}" src="{{ empty_placeholder }}" data-src="{{ media.thumbnail }}" class="video-image lazyload" {% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %} alt="{{ video_alt_text }}">
			</div>
		{% else %}
			<div class="js-video-image">
				<img src="{{ empty_placeholder }}" data-src="" class="lazyload video-image fade-in" alt="{{ video_alt_text }}" style="display: none;">
				<div class="placeholder-fade"></div>
			</div>
		{% endif %}

	</div>

{% if not product_native_video %}
	<div class="js-video-iframe embed-responsive embed-responsive-16by9" style="display: none;" data-video-color="{{ video_color }}"></div>
{% endif %}

{% if product_modal %}
	</div>
{% endif %}
