function Link(el)
    if not el.target:match("^https?://") then
      el.target = el.target:gsub("%.md$", ".html")
    end
    return el
  end