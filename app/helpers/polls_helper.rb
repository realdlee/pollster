module PollsHelper
  def poll_title_links(poll)
    content_tag :h1 do         #content_tag is a helper
      [ poll.title,
        link_to('show', poll),
        link_to('edit', edit_poll_path(poll)),
        link_to('destroy', poll, {
          :confirm => 'Are you sure?',
          :method => :delete
        })
      ].join(' ').html_safe
    end
  end
end
