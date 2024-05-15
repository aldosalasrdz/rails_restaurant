module ApplicationHelper
  def icon(name)
    render partial: "layouts/icons/#{name}"
  end

  def nav_menu_desktop(option)
    content_for :nav_menu_desktop do
      render partial: 'layouts/nav_menu_desktop', locals: { option: }
    end
  end

  def nav_menu_mobile(option)
    content_for :nav_menu_mobile do
      render partial: 'layouts/nav_menu_mobile', locals: { option: }
    end
  end

  def nav_link_desktop(path, selected: false, &block)
    css_class =
      if selected
        'border-teal-500 inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium'
      else
        'border-transparent text-neutral-500 hover:border-neutral-300 hover:text-neutral-700 inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium'
      end
    link_to path, class: css_class, &block
  end

  def nav_link_mobile(path, selected: false, &block)
    css_class =
      if selected
        'border-teal-500 bg-teal-50 text-teal-700 block border-l-4 py-2 pl-3 pr-4 text-base font-medium'
      else
        'border-transparent text-neutral-600 hover:border-neutral-300 hover:bg-neutral-50 hover:text-neutral-800 block border-l-4 py-2 pl-3 pr-4 text-base font-medium'
      end
    link_to path, class: css_class, &block
  end
end
