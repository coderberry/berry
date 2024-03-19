# berry.sh

This app is my personal blog and playground to vet out ideas and build interactive demos.

## ViewComponents

I am using the [view_component-contrib](https://github.com/palkan/view_component-contrib) extension to [ViewComponents](https://viewcomponents.org) as my component library.

### Available Components

```
components
├── container         # Container (responsive)
├── image             # Images
├── image_caption     # Image captions (with markdown)
├── markdown          # Markdown using Commonmarker
├── reading_time      # Time to read
├── title             # H-tags for title
├── tweet             # Embedded tweet (uses Twitter js)|
└── sitepress/
    ├── page          # Wrapper for Sitepress Page
    ├── article       # ArticleModel Container
    ├── article_card  # Article card for /blog/index
    └── breadcrumbs   # Breadcrumbs
```

### Component Helpers

To reduce the verbosity that comes with using ViewComponents, I created helper methods for each component. Each method is prefixed with a `c_` to isolate the namespace.

See [app/helpers/component_helper.rb](https://github.com/coderberry/berry/blob/main/app/helpers/component_helper.rb) to view how it was done.

### Tailwind YAML Files

The components each have their own `tailwind.yml` file that is used to configure the Tailwind class names. I decided to use this approach to reduce the amount of mental load when managing the templates, as well as provide a way for me to use shared classes between and within components. I know that I could have used CSS, but I wanted to keep the component code encapsulated and honestly, it was just more fun to build. This was inspired by [Nate Hopkin's](https://x.com/hopsoft) [turbo_boost-commands](https://github.com/hopsoft/turbo_boost-commands) gem.

## Article Structure

A blog post might have the following structure:

```erb
---
title: My Post
breadcrumb: My Post
---

<%= c_article(ArticleModel.new(current_page)) do %>
  <%= c_markdown do %>
    This is my post!

    I hope you like it.
  <% end %>

  <%= c_image path: "avatar.jpg", alt: "Eric Berry" %>
<% end %>
```


## Markdown & Syntax Highlighting

I decided to use the rust-backed [Commonmarker](https://github.com/gjtorikian/commonmarker) gem to render markdown.

Themes are in the `vendor/themes` directory.

```yaml
- active_4d
- all_hallows_eve
- all_hallows_eve_custom
- amy
- argonaut
- barf
- bbedit
- bespin
- birds_of_prey
- black_light
- black_pearl
- black_pearl_2
- blackboard
- blackboard_black
- blackboard_mod
- blackboard_new
- bongzilla
- boys_and_girls
- brilliance_black
- brilliance_dull
- choco
- claire
- classic_modified
- close_to_the_sea
- cloud_midnight
- clouds
- coal_graal
- cobalt
- coda
- coda_inkdeep
- cool_glow
- creeper
- css_edit
- daniel_fischer
- dawn
- dawn_mod_1
- deluxe
- django_dark
- django_smoothly
- dominion_day
- eiffel
- emacs_strict
- erebus
- espresso
- espresso_libre
- espresso_tutti
- fade_to_grey
- fake
- fluid_vision
- for_latex
- freckle
- freckle_mod_1
- freckle_mod_2
- friendship_bracelet
- funky_dashboard
- github
- glitter_bomb
- glow
- happy_deluxe
- happy_happy_joy_joy
- heroku
- heroku_code_samples
- idle
- idle_fingers
- ilife_5
- ilife_6
- imathis
- inkdeep
- iplastic
- ir_black
- ir_white
- juicy
- kr_theme
- lazy
- lazy_inkdeep
- lowlight
- mac_classic
- made_of_code
- magic_wb_amiga
- menage_a_trois
- merbivore
- merbivore_soft
- midnight
- minimal
- mono_industrial
- monokai
- monokai_dark
- monokai_mod
- monokai_mod_1
- monokai_philtr
- monokai_seangaffney
- monokai_textmater
- multi_markdown
- notebook
- notepad
- offy
- pastels_on_dark
- pastie
- pengwynn
- pengwynn_menlo
- plum_dumb
- putty
- rails_envy
- railscasts
- railscasts_boost
- rdark
- resesif
- ruby_blue
- ruby_robot
- ryan_light
- sidewalk_chalk
- sidewalk_chalk_green
- silverwind
- slush_poppies
- smoothy
- solarized_dark
- solarized_light
- space_cadet
- spectacular
- starlight
- succulent
- summer_camp_daybreak
- summer_camp_mod
- summer_sun
- sunburst
- sweyla
- sweyla_2
- swyphs
- tango
- tango_in_twilight
- tek
- text_ex_machina
- text_ex_machina_light
- tomorrow
- tomorrow_night
- tomorrow_night_blue
- tomorrow_night_bright
- tomorrow_night_eighties
- tomorrow_night_mod
- tubster
- twilight
- twilight_bright
- twilight_remix
- upstream_sunburst
- upstream_vibrant
- venom
- vibrant_fin
- vibrant_ink
- vibrant_ink_chopped
- vibrant_ink_remix
- vibrant_tango
- vintage_aurora
- whys_poignant
- zachstronaut_theme
- zenburn
- zenburnesque
```

## Inspirations & Attributions

I learned a great deal by studying [Marco Roth's](https://twitter.com/marcoroth_) [Hotwire.io](https://github.com/marcoroth/hotwire.io) codebase. The core of the [Sitepress](https://sitepress.cc) setup is based on his repo.

I really liked how [PolarisViewComponents](https://polarisviewcomponents.org/lookbook/) created helper methods for each of their components. This allows for less boilerplate and prettier code.

I took the Textmate Themes from [filmgirl/Textmate-Themes](https://github.com/filmgirl/TextMate-Themes) and renamed the all theme names to use underscores so they can be accessed via `:sym`.