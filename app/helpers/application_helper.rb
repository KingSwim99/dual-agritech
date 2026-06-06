module ApplicationHelper
  def icon(name, classname = "")
    render "icons/#{name}", classname: classname
  end
end
