module SelectOptions
  def select_with_options(method, options = {}, html_options = {})
    select(method, @object.attribute_options(method), options, html_options)
  end
end
