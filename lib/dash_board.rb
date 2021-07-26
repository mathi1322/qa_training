class Dashboard < SitePrism::Page
  element :menu, "div.menu-grid"

  def click_item(name)
    item = menu.find_all("div.menu-item").find { |x| x.find("div.item-label").text == name }
    item.click
  end
end
