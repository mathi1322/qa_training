class RowContent < SitePrism::Section
  element :label, 'span.title-span'

  def brand_title
    label.text
  end

end

class BrandList < SitePrism::Page
  set_url 'https://explorer.stage.lfmprod.in/#dashboard/start'
	element :brandlist, 'tbody'
	element :label, 'div.dataTables_info'
	element :search, 'input.form-control'
  
  sections : rows, RowContent 'td.brand-metadata'
  
  def brand?(name)
	  brandlist.find_all('td.brand-metadata').any?{|x| x.find('span.title-span').text == name }
  end

  def title
    rows.map{|x| x.brand_title}
  end

  def total_count
    label.text.gsub(/SHOWING (\d+) OF (\d+) BRANDS/, '/2')
  end

  def display_count
    label.text.gsub(/[^\d]/, '')[0].to_i
  end

  def title_count
    brandlist.find_all('td.brand-metadata').count
  end

  def filter_by(name)
	  search.set(name)
  end

  def clear_filter
    search.set('')
  end

  # def title
  #   brandlist.find('span.title-span').text
  # end

end