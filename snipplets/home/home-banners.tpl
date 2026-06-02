<section class="section-banners-home pl-2 px-md-3" data-store="home-banner-categories">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="js-swiper-banners swiper-container">
                <div class="swiper-wrapper">

                    {% set section_first = settings.home_order_position_0 == 'banners' %}

                    {% set priority_assigned = false %}

                    {% set num_banners = 0 %}
                    {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
                        {% set banner_show = attribute(settings,"#{banner}_show") %}
                        {% set banner_title = attribute(settings,"#{banner}_title") %}
                        {% set has_banner =  banner_show and (banner_title or banner_description or "#{banner}.jpg" | has_custom_image) %}
                        {% if has_banner %}
                            {% set num_banners = num_banners + 1 %}
                        {% endif %}
                    {% endfor %}

                    {% for banner in ['banner_01', 'banner_02', 'banner_03'] %}
                        {% set banner_show = attribute(settings,"#{banner}_show") %}
                        {% set banner_image = "#{banner}.jpg" | has_custom_image %}
                        {% set banner_title = attribute(settings,"#{banner}_title") %}
                        {% set banner_description = attribute(settings,"#{banner}_description") %}
                        {% set banner_url = attribute(settings,"#{banner}_url") %}
                        {% set has_banner = banner_show and (banner_title or banner_description or banner_image) %}
                        {% set has_banner_text = banner_title or banner_description %}

                        {# Assign priority to the first banner (no matter banner order) #}

                        {% set has_priority = has_banner and banner_image and not priority_assigned %}
                        {% if has_priority %}
                            {% set priority_assigned = true %}
                        {% endif %}

                        {% set apply_lazy_load = 
                            not section_first 
                            or not has_priority
                        %}

                        {% if apply_lazy_load %}
                            {% set banner_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                        {% else %}
                            {% set banner_src = "#{banner}.jpg" | static_url | settings_image_url('large') %}
                        {% endif %}
                        
                        {% if has_banner %}
                            <div class="col-md{% if num_banners == 1 %}-6{% endif %} swiper-slide">
                                <div class="textbanner">
                                    {% if banner_url %}
                                        <a class="textbanner-link" href="{{ banner_url | setting_url }}"{% if banner_title %} title="{{ banner_title }}" aria-label="{{ banner_title }}"{% else %} title="{{ 'Banner de' | translate }} {{ store.name }}" aria-label="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %}>
                                    {% endif %}
                                        <div class="textbanner-image{% if has_banner_text %} overlay{% endif %}">
                                            {% if banner_image %}
                                                    <img 
                                                        {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                                        {% if apply_lazy_load %}data-{% endif %}src="{{ banner_src }}"
                                                        {% if apply_lazy_load %}data-{% endif %}srcset="{{ "#{banner}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}.jpg" | static_url | settings_image_url('huge') }} 640w" 
                                                        {% if apply_lazy_load %}
                                                        data-sizes="auto" 
                                                        data-expand="-10" 
                                                        {% endif %}
                                                        class="textbanner-image-background {% if apply_lazy_load %}lazyautosizes lazyload fade-in{% endif %}" 
                                                        {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} 
                                                    />
                                            {% endif %}
                                            {% if has_banner_text %}
                                                <div class="textbanner-text">
                                                    {% if banner_title %}
                                                        <div class="h1 textbanner-title">{{ banner_title }}</div>
                                                    {% endif %}
                                                    {% if banner_description %}
                                                        <div class="textbanner-paragraph">{{ banner_description }}</div>
                                                    {% endif %}
                                                </div>
                                            {% endif %}
                                        </div>
                                    {% if banner_url %}
                                        </a>
                                    {% endif %}
                                </div>
                            </div>
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</section>
