module ApplicationHelper
	def my_name
		return "Dom Oliaro"
	end

    def form_group_tag(errors, &block)
        if errors.any?
            content_tag :div, capture(&block), class: 'form-group has-error'
        else
            content_tag :div, capture(&block), class: 'form-group'
        end
    end

    def markdown_body(body)
        render_as_markdown body
    end

    def markdown_title(title)
        render_as_markdown title
    end

    private

    def render_as_markdown(markdown)
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true}
        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        (redcarpet.render markdown).html_safe
    end
end
