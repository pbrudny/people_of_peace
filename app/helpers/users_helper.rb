module UsersHelper
  def bell(value)
    bell = value ? 'fa fa-bell' : 'fa fa-bell-slash '
    content_tag(:i, class: bell) do
    end
  end
end

