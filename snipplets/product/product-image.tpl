{% set has_multiple_slides = product.media_count > 1 or product.video_url %}

{% if product.media_count > 0 %}
    <div class="js-swiper-product product-detail-slider swiper-container">

        {{ component('nubesdk-slot', { type: "product_detail_image" }) }}

        {% include 'snipplets/labels.tpl' with {'product_detail': true} %}
        <div class="js-product-detail-back product-detail-back d-md-none d-inline-block">
            {% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-2x svg-icon-invert mr-1"} %}
        </div>
        <div class="swiper-wrapper">
            {% for media in product.media %}
                {% if media.isImage %}
                 <div class="js-product-slide swiper-slide slider-slide product-slide" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
                    <a href="{{ media | product_image_url('original') }}" data-fancybox="product-gallery" class="d-block p-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">

                        {% set apply_lazy_load = not loop.first %}

                        {% if apply_lazy_load %}
                            {% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                        {% else %}
                            {% set product_image_src = media | product_image_url('large') %}
                        {% endif %}

                        <img
                            {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                            {% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
                            {% if apply_lazy_load %}data-{% endif %}srcset='{{ media | product_image_url('large') }} 480w, {{ media | product_image_url('huge') }} 640w, {{ media | product_image_url('original') }} 1024w'
                            class="js-product-slide-img product-slider-image img-absolute img-absolute-centered {% if apply_lazy_load %}lazyautosizes lazyload{% endif %}"
                            {% if apply_lazy_load %}data-sizes="auto"{% endif %}
                            {% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
                            {% if media.alt %}alt="{{media.alt}}"{% endif %}/>
                    </a>
                 </div>
                {% else %}
                    {% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true} %}
                {% endif %}
            {% endfor %}
            {% include 'snipplets/product/product-video.tpl' with {video_id: 'yt'} %}
        </div>
        <div class="js-swiper-product-pagination swiper-pagination swiper-pagination-white d-md-none"></div>
    </div>
{% endif %}
