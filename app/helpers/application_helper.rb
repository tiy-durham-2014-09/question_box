module ApplicationHelper
  def markdown(text)
    return if text.nil?
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new,
                                          escape_html: true,
                                          safe_links_only: true)
    @renderer.render(text).html_safe
  end
end
